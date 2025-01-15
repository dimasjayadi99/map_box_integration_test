import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_box_app/app/core/common/constants/app_path.dart';
import 'package:map_box_app/app/features/map_box/domain/entities/suggestion_entity.dart';
import 'package:map_box_app/app/features/map_box/domain/use_cases/fetch_route.dart';
import 'package:map_box_app/app/features/map_box/domain/use_cases/search_suggestion.dart';
import 'package:map_box_app/app/features/map_box/domain/use_cases/suggestion_on_tap.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

part 'map_box_event.dart';
part 'map_box_state.dart';

class MapBoxBloc extends Bloc<MapBoxEvent, MapBoxState> {
  final FetchRoute fetchRoute;
  final SearchSuggestion searchSuggestion;
  final SuggestionOnTap suggestionOnTap;

  List<Position> corList = [];
  late PointAnnotationManager pointAnnotationManager;
  late PolylineAnnotationManager lineAnnotationManager;
  late CameraOptions initialCameraPosition;
  MapboxMap? mapboxMap;

  MapBoxBloc(
      {required this.fetchRoute,
      required this.searchSuggestion,
      required this.suggestionOnTap})
      : super(MapBoxInitState()) {
    on<OnTapMap>(onTapMap);
    on<OnSuggestionSearch>(searchSuggestions);
    on<OnClearSuggestion>((event, emit) {
      emit(SearchSuccessState(const []));
    });
    on<OnTapSuggestion>(tapSuggestion);

    initialCameraPosition = CameraOptions(
      center: Point(
        coordinates: Position(106.8456, -6.2088),
      ),
      zoom: 12.0,
    );
  }

  Future<void> searchSuggestions(
      OnSuggestionSearch event, Emitter<MapBoxState> emit) async {
    emit(SearchLoadingState());
    try {
      final response = await searchSuggestion.searchSuggestion(event.query);
      emit(SearchSuccessState(response));
    } catch (e) {
      emit(SearchFailedState(e.toString()));
    }
  }

  Future<void> tapSuggestion(
      OnTapSuggestion event, Emitter<MapBoxState> emit) async {
    try {
      final response = await suggestionOnTap.suggestionOnTap(event.mapBoxId);

      if (response.lat != 0 || response.lon != 0) {
        final newCameraPosition = CameraOptions(
          center: Point(
            coordinates: Position(response.lon, response.lat),
          ),
          zoom: 15.0,
        );

        mapboxMap?.flyTo(
          newCameraPosition,
          MapAnimationOptions(duration: 1500, startDelay: 0),
        );

        emit(SearchSuccessState(const []));
      }
    } catch (e) {
      emit(SearchFailedState(e.toString()));
    }
  }

  Future<void> fetchGenerateRoute() async {
    try {
      final response = await fetchRoute.fetchRoute(corList);
      drawRoute(response);
    } catch (e) {
      rethrow;
    }
  }

  void onMapCreated(MapboxMap mapboxMap) async {
    this.mapboxMap = mapboxMap;
    mapboxMap.loadStyleURI(MapboxStyles.MAPBOX_STREETS);
    mapboxMap.setCamera(initialCameraPosition);
    mapboxMap.scaleBar.updateSettings(ScaleBarSettings(
      enabled: false,
    ));
    pointAnnotationManager =
        await mapboxMap.annotations.createPointAnnotationManager();
    lineAnnotationManager =
        await mapboxMap.annotations.createPolylineAnnotationManager();
  }

  void onTapMap(OnTapMap event, Emitter<MapBoxState> emit) async {
    try {
      final position = Position(
        event.context.point.coordinates.lng,
        event.context.point.coordinates.lat,
      );
      corList.add(position);

      final ByteData bytes = await rootBundle.load(AppPath.markerPath);
      final Uint8List list = bytes.buffer.asUint8List();

      if (corList.length <= 5) {
        pointAnnotationManager.create(
          PointAnnotationOptions(
            geometry: Point(coordinates: position),
            image: list,
          ),
        );
        await fetchGenerateRoute();
      }
    } catch (e) {
      rethrow;
    }
  }

  void drawRoute(List<Position> routePoints) {
    lineAnnotationManager.deleteAll();
    lineAnnotationManager.create(
      PolylineAnnotationOptions(
        geometry: LineString(
          coordinates: routePoints,
        ),
        lineWidth: 4.0,
        lineColor: 0xff212121,
      ),
    );
  }

  void zoomIn() {
    if (mapboxMap != null) {
      mapboxMap!.getCameraState().then((cameraState) {
        double currentZoom = cameraState.zoom;

        double newZoom = currentZoom + 1.0;

        mapboxMap!.flyTo(
          CameraOptions(
            zoom: newZoom,
          ),
          MapAnimationOptions(duration: 300, startDelay: 0),
        );
      });
    }
  }

  void zoomOut() {
    if (mapboxMap != null) {
      mapboxMap!.getCameraState().then((cameraState) {
        double currentZoom = cameraState.zoom;

        double newZoom = currentZoom - 1.0;

        mapboxMap!.flyTo(
          CameraOptions(
            zoom: newZoom,
          ),
          MapAnimationOptions(duration: 300, startDelay: 0),
        );
      });
    }
  }

  void resetRoute() {
    lineAnnotationManager.deleteAll();
    pointAnnotationManager.deleteAll();
    corList.clear();
  }
}

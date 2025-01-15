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

  MapBoxBloc({
    required this.fetchRoute,
    required this.searchSuggestion,
    required this.suggestionOnTap,
  }) : super(MapBoxInitState()) {
    on<OnTapMap>(_onTapMap);
    on<OnSuggestionSearch>(_searchSuggestions);
    on<OnClearSuggestion>((event, emit) => emit(SearchSuccessState(const [])));
    on<OnTapSuggestion>(_tapSuggestion);

    initialCameraPosition = _getInitialCameraOptions();
  }

  CameraOptions _getInitialCameraOptions() {
    return CameraOptions(
      center: Point(
        coordinates: Position(106.8456, -6.2088),
      ),
      zoom: 12.0,
    );
  }

  Future<void> _searchSuggestions(
      OnSuggestionSearch event, Emitter<MapBoxState> emit) async {
    emit(SearchLoadingState());
    try {
      final suggestions = await searchSuggestion.searchSuggestion(event.query);
      emit(SearchSuccessState(suggestions));
    } catch (e) {
      emit(SearchFailedState(e.toString()));
    }
  }

  Future<void> _tapSuggestion(
      OnTapSuggestion event, Emitter<MapBoxState> emit) async {
    try {
      final location = await suggestionOnTap.suggestionOnTap(event.mapBoxId);
      if (location.lat != 0 || location.lon != 0) {
        _moveCamera(location.lat, location.lon);
        await _addMarker(location.lat, location.lon);
        emit(SearchSuccessState(const [])); // Clear suggestions
      }
    } catch (e) {
      emit(SearchFailedState(e.toString()));
    }
  }

  Future<void> _onTapMap(OnTapMap event, Emitter<MapBoxState> emit) async {
    try {
      final position = Position(
        event.context.point.coordinates.lng,
        event.context.point.coordinates.lat,
      );
      corList.add(position);

      if (corList.length <= 5) {
        await _addMarker(position.lat.toDouble(), position.lng.toDouble());
        await _fetchAndDrawRoute();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _fetchAndDrawRoute() async {
    try {
      final routePoints = await fetchRoute.fetchRoute(corList);
      _drawRoute(routePoints);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _addMarker(double lat, double lon) async {
    final ByteData bytes = await rootBundle.load(AppPath.markerPath);
    final Uint8List list = bytes.buffer.asUint8List();

    pointAnnotationManager.create(
      PointAnnotationOptions(
        geometry: Point(coordinates: Position(lon, lat)),
        image: list,
      ),
    );
  }

  void _drawRoute(List<Position> routePoints) {
    lineAnnotationManager.deleteAll();
    lineAnnotationManager.create(
      PolylineAnnotationOptions(
        geometry: LineString(coordinates: routePoints),
        lineWidth: 4.0,
        lineColor: 0xff212121,
      ),
    );
  }

  void _moveCamera(double lat, double lon) {
    final newCameraOptions = CameraOptions(
      center: Point(coordinates: Position(lon, lat)),
      zoom: 15.0,
    );

    mapboxMap?.flyTo(
      newCameraOptions,
      MapAnimationOptions(duration: 1500),
    );
  }

  void onMapCreated(MapboxMap map) async {
    mapboxMap = map;
    map.loadStyleURI(MapboxStyles.MAPBOX_STREETS);
    map.setCamera(initialCameraPosition);
    map.scaleBar.updateSettings(ScaleBarSettings(enabled: false));
    pointAnnotationManager =
        await map.annotations.createPointAnnotationManager();
    lineAnnotationManager =
        await map.annotations.createPolylineAnnotationManager();
  }

  void zoomIn() => _adjustZoom(1.0);

  void zoomOut() => _adjustZoom(-1.0);

  void _adjustZoom(double delta) {
    mapboxMap?.getCameraState().then((state) {
      final newZoom = state.zoom + delta;
      mapboxMap?.flyTo(
        CameraOptions(zoom: newZoom),
        MapAnimationOptions(duration: 300),
      );
    });
  }

  void resetRoute() {
    lineAnnotationManager.deleteAll();
    pointAnnotationManager.deleteAll();
    corList.clear();
  }
}

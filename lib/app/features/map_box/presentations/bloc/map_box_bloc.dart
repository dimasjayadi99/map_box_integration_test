import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_box_app/app/core/common/constants/app_path.dart';
import 'package:map_box_app/app/features/map_box/domain/use_cases/fetch_route.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

part 'map_box_event.dart';
part 'map_box_state.dart';

class MapBoxBloc extends Bloc<MapBoxEvent, MapBoxState> {
  final FetchRoute fetchRoute;

  List<Position> corList = [];
  late PointAnnotationManager pointAnnotationManager;
  late PolylineAnnotationManager lineAnnotationManager;
  late CameraOptions initialCameraPosition;
  MapboxMap? mapboxMap;

  MapBoxBloc({required this.fetchRoute}) : super(MapBoxInitState()) {
    on<OnTapMap>(onTapMap);

    initialCameraPosition = CameraOptions(
      center: Point(
        coordinates: Position(106.8456, -6.2088),
      ),
      zoom: 12.0,
    );
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
    emit(MapBoxLoadingState());
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

  Future<void> fetchGenerateRoute() async {
    try {
      final response = await fetchRoute.fetchRoute(corList);
      drawRoute(response);
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

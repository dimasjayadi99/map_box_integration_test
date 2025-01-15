class CoordinateModel {
  final num lat;
  final num lon;

  CoordinateModel({required this.lat, required this.lon});

  @override
  String toString() {
    return 'CoordinateModel(lat: $lat, lon: $lon)';
  }
}

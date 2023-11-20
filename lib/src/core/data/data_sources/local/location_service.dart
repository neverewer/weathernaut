import 'package:geolocator/geolocator.dart';
import 'package:weathernaut/src/core/data/models/position.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    final location = await Geolocator.getCurrentPosition(
      timeLimit: const Duration(seconds: 2),
    );

    final pos = PositionModel(
      lat: location.latitude,
      lon: location.longitude,
    );
  }
}

import 'package:geolocator/geolocator.dart';
import 'package:weathernaut/src/core/data/models/position.dart';

class PositionService {
  Future<PositionModel> getCurrentPosition() async {
    final geoPosition = await Geolocator.getCurrentPosition();

    final position = PositionModel(
      lat: geoPosition.latitude,
      lon: geoPosition.longitude,
    );

    return position;
  }
}

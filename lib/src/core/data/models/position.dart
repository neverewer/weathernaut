import 'package:weathernaut/src/core/domain/entites/position.dart';

class PositionModel {
  final double lat;
  final double lon;

  PositionModel({
    required this.lat,
    required this.lon,
  });

  PositionEntity toEntity() => PositionEntity(
        lat: lat,
        lon: lon,
      );
}

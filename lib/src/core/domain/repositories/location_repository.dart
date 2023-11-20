import 'package:weathernaut/src/core/domain/entites/location.dart';

abstract class LocationRepository {
  Future<LocationEntity> getCurrentLocation();
}

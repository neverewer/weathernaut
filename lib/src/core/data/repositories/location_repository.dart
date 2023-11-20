import 'package:weathernaut/src/core/data/data_sources/local/location_service.dart';
import 'package:weathernaut/src/core/domain/entites/position.dart';
import 'package:weathernaut/src/core/domain/repositories/location_repository.dart';

class LocationRepositoryImp implements LocationRepository {
  final LocationService locationService;

  LocationRepositoryImp({
    required this.locationService,
  });

  @override
  Future<PositionEntity> getCurrentLocation() async {
    var geoPosition = await locationService.getCurrentLocation();

    return position;
  }
}

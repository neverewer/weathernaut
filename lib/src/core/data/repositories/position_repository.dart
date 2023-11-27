import 'package:weathernaut/src/core/data/data_sources/local/position_service.dart';
import 'package:weathernaut/src/core/domain/entites/position.dart';
import 'package:weathernaut/src/core/domain/repositories/position_repository.dart';

class PositionRepositoryImp implements PositionRepository {
  final PositionService positionService;

  PositionRepositoryImp({
    required this.positionService,
  });

  @override
  Future<PositionEntity> getCurrentPosition() async {
    try {
      final geoPosition = await positionService.getCurrentPosition();
      final position = geoPosition.toEntity();
      return position;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(e, stackTrace);
    }
  }
}

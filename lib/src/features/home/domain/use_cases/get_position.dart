import 'package:geolocator/geolocator.dart';
import 'package:weathernaut/src/core/domain/entites/position.dart';
import 'package:weathernaut/src/core/domain/repositories/position_repository.dart';

class GetPositionUseCase {
  final PositionRepository positionRepository;

  GetPositionUseCase({required this.positionRepository});

  Future<PositionEntity> call() async {
    try {
      await Geolocator.requestPermission();
      final position = await positionRepository.getCurrentPosition();
      return position;
    } on Object catch (e, stackTrace) {
      Error.throwWithStackTrace(e, stackTrace);
    }
  }
}

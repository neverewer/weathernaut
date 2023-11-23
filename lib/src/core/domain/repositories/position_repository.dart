import 'package:weathernaut/src/core/domain/entites/position.dart';

abstract class PositionRepository {
  Future<PositionEntity> getCurrentPosition();
}

import 'package:dartz/dartz.dart';
import 'package:foodix/core/errors/failure.dart';

import '../../../../core/shared/models/food_model.dart';

abstract class AddFoodRepository {
  Future<Either<Failure, void>> addFood(
    String categoryName,
    FoodModel food,
  );
}

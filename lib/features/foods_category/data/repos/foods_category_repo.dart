import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:foodix/core/shared/models/food_model.dart';

import '../../../../core/errors/failure.dart';

abstract class FoodsCategoryRepository {
  Stream<Either<Failure, DataSnapshot>> getFoodsCategory(String categoryId);

  Future<Either<Failure, void>> updateFood(String categoryId, FoodModel food);

  Future<Either<Failure, void>> deleteFood(String categoryId, String foodId);
}

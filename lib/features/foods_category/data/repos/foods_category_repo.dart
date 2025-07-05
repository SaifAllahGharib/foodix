import 'package:failure_handler/failure_handler.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:foodix/core/shared/models/food_model.dart';
import 'package:foodix/core/utils/result.dart';

abstract class FoodsCategoryRepository {
  Stream<Result<AppFailure, DataSnapshot>> getFoodsCategory(String categoryId);

  Future<Result<AppFailure, void>> updateFood(
    String categoryId,
    FoodModel food,
  );

  Future<Result<AppFailure, void>> deleteFood(String categoryId, String foodId);
}

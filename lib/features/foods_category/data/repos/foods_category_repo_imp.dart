import 'package:failure_handler/failure_handler.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../../core/services/db_services.dart';
import '../../../../core/shared/models/food_model.dart';
import '../../../../core/utils/result.dart';
import 'foods_category_repo.dart';

class FoodsCategoryRepositoryImp implements FoodsCategoryRepository {
  final DBServices _dbServices;

  FoodsCategoryRepositoryImp(this._dbServices);

  @override
  Stream<Result<AppFailure, DataSnapshot>> getFoodsCategory(String categoryId) {
    return _dbServices.getFoodsCategory(categoryId).map((snapshot) {
      try {
        return Success(snapshot);
      } catch (e) {
        return Failure(ErrorHandler.handle(e));
      }
    });
  }

  @override
  Future<Result<AppFailure, void>> deleteFood(
    String categoryId,
    String foodId,
  ) async {
    try {
      return Success(await _dbServices.deleteFood(categoryId, foodId));
    } catch (e) {
      return Failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Result<AppFailure, void>> updateFood(
    String categoryId,
    FoodModel food,
  ) async {
    try {
      return Success(await _dbServices.updateFood(categoryId, food));
    } catch (e) {
      return Failure(ErrorHandler.handle(e));
    }
  }
}

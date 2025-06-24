import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:foodix/core/errors/failure.dart';
import 'package:foodix/core/shared/models/food_model.dart';

import '../../../../core/services/db_services.dart';
import 'foods_category_repo.dart';

class FoodsCategoryRepositoryImp implements FoodsCategoryRepository {
  final DBServices _dbServices;

  FoodsCategoryRepositoryImp(this._dbServices);

  @override
  Stream<Either<Failure, DataSnapshot>> getFoodsCategory(String categoryId) {
    return _dbServices.getFoodsCategory(categoryId).map((snapshot) {
      try {
        return right(snapshot);
      } catch (e) {
        return left(
          FirebaseDBFailure(e is FirebaseDBFailure ? e.errorMsg : e.toString()),
        );
      }
    });
  }

  @override
  Future<Either<Failure, void>> deleteFood(
    String categoryId,
    String foodId,
  ) async {
    try {
      return right(await _dbServices.deleteFood(categoryId, foodId));
    } catch (e) {
      return left(
        FirebaseDBFailure(e is FirebaseDBFailure ? e.errorMsg : e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateFood(
    String categoryId,
    FoodModel food,
  ) async {
    try {
      return right(await _dbServices.updateFood(categoryId, food));
    } catch (e) {
      return left(
        FirebaseDBFailure(e is FirebaseDBFailure ? e.errorMsg : e.toString()),
      );
    }
  }
}

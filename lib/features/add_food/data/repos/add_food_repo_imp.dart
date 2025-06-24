import 'package:dartz/dartz.dart';
import 'package:foodix/core/errors/failure.dart';
import 'package:foodix/core/services/db_services.dart';
import 'package:foodix/features/add_food/data/repos/add_food_repo.dart';

import '../../../../core/shared/models/food_model.dart';

class AddFoodRepositoryImp extends AddFoodRepository {
  final DBServices _dbServices;

  AddFoodRepositoryImp(this._dbServices);

  @override
  Future<Either<Failure, void>> addFood(
    String categoryId,
    FoodModel food,
  ) async {
    try {
      return right(await _dbServices.addFood(categoryId, food));
    } catch (e) {
      if (e is FirebaseDBFailure) {
        return left(FirebaseDBFailure(e.errorMsg));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }
}

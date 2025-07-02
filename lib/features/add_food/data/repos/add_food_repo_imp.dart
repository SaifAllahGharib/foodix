import 'package:failure_handler/failure_handler.dart';
import 'package:foodix/core/services/db_services.dart';
import 'package:foodix/core/utils/result.dart';
import 'package:foodix/features/add_food/data/repos/add_food_repo.dart';

import '../../../../core/shared/models/food_model.dart';

class AddFoodRepositoryImp extends AddFoodRepository {
  final DBServices _dbServices;

  AddFoodRepositoryImp(this._dbServices);

  @override
  Future<Result<AppFailure, void>> addFood(
    String categoryId,
    FoodModel food,
  ) async {
    try {
      return Success(await _dbServices.addFood(categoryId, food));
    } catch (e) {
      return Failure(ErrorHandler.handle(e));
    }
  }
}

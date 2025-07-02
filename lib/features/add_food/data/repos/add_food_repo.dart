import 'package:failure_handler/failure_handler.dart';

import '../../../../core/shared/models/food_model.dart';
import '../../../../core/utils/result.dart';

abstract class AddFoodRepository {
  Future<Result<AppFailure, void>> addFood(String categoryName, FoodModel food);
}

import 'package:foodix/core/shared/models/food_model.dart';

sealed class FoodsCategoryState {}

class FoodsCategoryInit extends FoodsCategoryState {}

class FoodsCategoryLoading extends FoodsCategoryState {}

class FoodsCategorySuccess extends FoodsCategoryState {
  final List<FoodModel>? foods;

  FoodsCategorySuccess(this.foods);
}

class FoodsCategoryUpdateFoodSuccess extends FoodsCategoryState {}

class FoodsCategoryDeleteFoodSuccess extends FoodsCategoryState {}

class FoodsCategoryFailure extends FoodsCategoryState {
  final String errorMsg;

  FoodsCategoryFailure(this.errorMsg);
}

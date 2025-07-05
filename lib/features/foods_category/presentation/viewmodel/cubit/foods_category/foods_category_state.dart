import 'package:foodix/core/shared/models/food_model.dart';
import 'package:foodix/core/shared/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'foods_category_state.freezed.dart';

@freezed
sealed class FoodsCategoryState with _$FoodsCategoryState {
  const factory FoodsCategoryState({
    @Default(PageState.init()) PageState<List<FoodModel>> getFoodsStatus,
    @Default(PageState.init()) PageState<void> updateFoodStatus,
    @Default(PageState.init()) PageState<void> deleteFoodStatus,
  }) = _FoodsCategoryState;
}

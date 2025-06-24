import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/shared/models/category_model.dart';
import 'package:foodix/core/shared/models/food_model.dart';
import 'package:foodix/features/foods_category/data/repos/foods_category_repo.dart';

import 'foods_category_state.dart';

class FoodsCategoryCubit extends Cubit<FoodsCategoryState> {
  final FoodsCategoryRepository _foodsCategoryRepository;
  StreamSubscription? _categorySubscription;

  FoodsCategoryCubit(this._foodsCategoryRepository)
    : super(FoodsCategoryInit());

  @override
  Future<void> close() {
    _categorySubscription?.cancel();
    return super.close();
  }

  void getFoodsCategory(String categoryId) {
    emit(FoodsCategoryLoading());

    _categorySubscription?.cancel();

    _categorySubscription = _foodsCategoryRepository
        .getFoodsCategory(categoryId)
        .listen((result) {
          if (isClosed) return;
          result.fold((l) => emit(FoodsCategoryFailure(l.errorMsg)), (
            snapshot,
          ) {
            if (snapshot.exists) {
              CategoryModel category = CategoryModel.fromJson(
                snapshot.value as Map,
              );

              emit(FoodsCategorySuccess(category.foods));
            }
          });
        });
  }

  Future<void> updateFood(String categoryId, FoodModel food) async {
    emit(FoodsCategoryLoading());

    final res = await _foodsCategoryRepository.updateFood(categoryId, food);

    res.fold((l) => emit(FoodsCategoryFailure(l.errorMsg)), (_) {
      emit(FoodsCategoryUpdateFoodSuccess());
    });
  }

  Future<void> deleteFood(String categoryId, String foodId) async {
    emit(FoodsCategoryLoading());

    final res = await _foodsCategoryRepository.deleteFood(categoryId, foodId);

    res.fold((l) => emit(FoodsCategoryFailure(l.errorMsg)), (_) {
      emit(FoodsCategoryDeleteFoodSuccess());
    });
  }
}

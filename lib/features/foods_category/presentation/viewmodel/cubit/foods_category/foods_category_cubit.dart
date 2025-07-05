import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/shared/models/category_model.dart';
import 'package:foodix/core/shared/models/food_model.dart';
import 'package:foodix/core/shared/page_state.dart';
import 'package:foodix/features/foods_category/data/repos/foods_category_repo.dart';

import 'foods_category_state.dart';

class FoodsCategoryCubit extends Cubit<FoodsCategoryState> {
  final FoodsCategoryRepository _foodsCategoryRepository;
  StreamSubscription? _categorySubscription;

  FoodsCategoryCubit(this._foodsCategoryRepository)
    : super(const FoodsCategoryState());

  @override
  Future<void> close() {
    _categorySubscription?.cancel();
    return super.close();
  }

  void getFoodsCategory(String categoryId) {
    emit(state.copyWith(getFoodsStatus: const PageState.loading()));

    _categorySubscription?.cancel();

    _categorySubscription = _foodsCategoryRepository
        .getFoodsCategory(categoryId)
        .listen((result) {
          if (isClosed) return;

          result.when(
            failure: (failure) {
              emit(
                state.copyWith(
                  getFoodsStatus: PageState.failure(failure.message!),
                ),
              );
            },
            success: (snapshot) {
              if (snapshot.exists) {
                final category = CategoryModel.fromJson(snapshot.value as Map);
                final foods = category.foods ?? [];

                emit(state.copyWith(getFoodsStatus: PageState.success(foods)));
              }
            },
          );
        });
  }

  Future<void> updateFood(String categoryId, FoodModel food) async {
    emit(state.copyWith(updateFoodStatus: const PageState.loading()));

    final res = await _foodsCategoryRepository.updateFood(categoryId, food);

    res.when(
      failure: (failure) => emit(
        state.copyWith(updateFoodStatus: PageState.failure(failure.message!)),
      ),
      success: (_) =>
          emit(state.copyWith(updateFoodStatus: const PageState.success())),
    );
  }

  Future<void> deleteFood(String categoryId, String foodId) async {
    emit(state.copyWith(deleteFoodStatus: const PageState.loading()));

    final res = await _foodsCategoryRepository.deleteFood(categoryId, foodId);

    res.when(
      failure: (failure) => emit(
        state.copyWith(deleteFoodStatus: PageState.failure(failure.message!)),
      ),
      success: (_) =>
          emit(state.copyWith(deleteFoodStatus: const PageState.success())),
    );
  }
}

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/shared/models/category_model.dart';
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

  void getFoodsCategory(String categoryName) {
    emit(FoodsCategoryLoading());

    _categorySubscription?.cancel();

    _categorySubscription = _foodsCategoryRepository
        .getFoodsCategory(categoryName)
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
}

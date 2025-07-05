import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/features/home/data/repos/main_seller/main_seller_repo.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/main_seller/main_seller_state.dart';
import 'package:foodix/features/my_restaurant/data/models/restaurant_model.dart';

import '../../../../../../core/services/shared_preferences_service.dart';
import '../../../../../../core/shared/models/category_model.dart';
import '../../../../../../core/utils/enums.dart';

class MainSellerCubit extends Cubit<MainSellerState> {
  final MainSellerRepository _mainSellerRepository;
  final SharedPreferencesService _sharedPreferencesService;
  bool _isEnabled = false;
  StreamSubscription? _categorySubscription;

  MainSellerCubit(this._mainSellerRepository, this._sharedPreferencesService)
    : super(MainSellerInit());

  @override
  Future<void> close() {
    _categorySubscription?.cancel();
    return super.close();
  }

  Future<void> addCategory(CategoryModel category) async {
    emit(MainSellerLoading());
    final result = await _mainSellerRepository.addCategory(category);

    result.when(
      failure: (l) => emit(MainSellerFailure(l.message!)),
      success: (r) => emit(MainSellerAddCategory()),
    );
  }

  void getCategories() {
    emit(MainSellerLoading());
    _categorySubscription?.cancel();

    _categorySubscription = _mainSellerRepository.getCategories().listen((
      result,
    ) {
      if (isClosed) return;
      result.when(
        failure: (l) => emit(MainSellerFailure(l.message!)),
        success: (snapshot) {
          List<CategoryModel> categoryList = [];
          if (snapshot.exists) {
            final Map categories = snapshot.value as Map;
            categoryList = categories.entries
                .map((e) => CategoryModel.fromJson(e.value as Map))
                .toList();
          }
          emit(MainSellerGetCategory(categoryList));
        },
      );
    });
  }

  Future<void> getMyRestaurant() async {
    final result = await _mainSellerRepository.getMyRestaurant();

    if (isClosed) return;
    result.when(
      failure: (l) => emit(MainSellerFailure(l.message!)),
      success: (restaurant) => emit(
        MainSellerGetMyRestaurant(
          RestaurantModel.fromJson(restaurant?.value as Map? ?? {}),
        ),
      ),
    );
  }

  Future<bool> storeRestaurantInLocalDB(RestaurantModel restaurant) async {
    try {
      await Future.wait([
        _sharedPreferencesService.storeString(
          RestaurantInfoParams.restaurantName.toString(),
          restaurant.name!,
        ),
        _sharedPreferencesService.storeString(
          RestaurantInfoParams.deliveryTime.toString(),
          restaurant.deliveryTime.toString(),
        ),
        _sharedPreferencesService.storeString(
          RestaurantInfoParams.deliveryCost.toString(),
          restaurant.deliveryCost.toString(),
        ),
        _sharedPreferencesService.storeString(
          RestaurantInfoParams.openTime.toString(),
          restaurant.openTime!,
        ),
        _sharedPreferencesService.storeString(
          RestaurantInfoParams.closeTime.toString(),
          restaurant.closeTime!,
        ),
      ]);
      return true;
    } catch (_) {
      return false;
    }
  }

  void enableButton(TextEditingController controller) {
    _isEnabled = controller.text.isNotEmpty;
    emit(MainSellerEnableButton());
  }

  bool get isEnabled => _isEnabled;
}

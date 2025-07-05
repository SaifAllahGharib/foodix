import 'package:flutter/material.dart';  
import 'package:flutter_bloc/flutter_bloc.dart';  
import 'package:foodix/core/shared/page_state.dart';  
import 'package:foodix/features/my_restaurant/data/models/restaurant_model.dart';  
import 'package:foodix/features/my_restaurant/data/repos/my_restaurant_repo.dart';  

import '../../../../../../core/services/shared_preferences_service.dart';  
import '../../../../../../core/utils/enums.dart';  
import 'my_restaurant_state.dart';  

class MyRestaurantCubit extends Cubit<MyRestaurantState> {
  final MyRestaurantRepository _myRestaurantRepository;
  final SharedPreferencesService _sharedPreferencesService;
  bool _isValid = false;

  MyRestaurantCubit(
    this._myRestaurantRepository,
    this._sharedPreferencesService,
  ) : super(const MyRestaurantState());

  Future<void> createRestaurant(RestaurantModel restaurant) async {
    emit(state.copyWith(status: const PageState.loading()));
    final result = await _myRestaurantRepository.createRestaurant(restaurant);

    result.when(
      failure: (failure) =>
          emit(state.copyWith(status: PageState.failure(failure.message!))),
      success: (_) {
        _saveRestaurant(restaurant);
        emit(state.copyWith(status: PageState.success(restaurant)));
      },
    );
  }

  void _saveRestaurant(RestaurantModel restaurantModel) async {
    await Future.wait([
      _sharedPreferencesService.storeString(
        RestaurantInfoParams.restaurantName.toString(),
        restaurantModel.name!,
      ),
      _sharedPreferencesService.storeString(
        RestaurantInfoParams.deliveryTime.toString(),
        restaurantModel.deliveryTime.toString(),
      ),
      _sharedPreferencesService.storeString(
        RestaurantInfoParams.deliveryCost.toString(),
        restaurantModel.deliveryCost.toString(),
      ),
      _sharedPreferencesService.storeString(
        RestaurantInfoParams.openTime.toString(),
        restaurantModel.openTime!,
      ),
      _sharedPreferencesService.storeString(
        RestaurantInfoParams.closeTime.toString(),
        restaurantModel.closeTime!,
      ),
    ]);
  }

  Future<void> updateRestaurantName(String name) async {
    emit(state.copyWith(status: const PageState.loading()));
    final result = await _myRestaurantRepository.updateRestaurantName(name);

    result.when(
      failure: (failure) =>
          emit(state.copyWith(status: PageState.failure(failure.message!))),
      success: (_) => emit(state.copyWith(nameUpdated: true)),
    );
  }

  Future<void> updateRestaurantTimeDelivery(int time) async {
    emit(state.copyWith(status: const PageState.loading()));
    final result = await _myRestaurantRepository.updateRestaurantTimeDelivery(
      time,
    );

    result.when(
      failure: (failure) =>
          emit(state.copyWith(status: PageState.failure(failure.message!))),
      success: (_) => emit(state.copyWith(timeDeliveryUpdated: true)),
    );
  }

  Future<void> updateRestaurantCostDelivery(int cost) async {
    emit(state.copyWith(status: const PageState.loading()));
    final result = await _myRestaurantRepository.updateRestaurantCostDelivery(
      cost,
    );

    result.when(
      failure: (failure) =>
          emit(state.copyWith(status: PageState.failure(failure.message!))),
      success: (_) => emit(state.copyWith(costDeliveryUpdated: true)),
    );
  }

  Future<void> updateRestaurantOpenTime(String openTime) async {
    emit(state.copyWith(status: const PageState.loading()));
    final result = await _myRestaurantRepository.updateRestaurantOpenTime(
      openTime,
    );

    result.when(
      failure: (failure) =>
          emit(state.copyWith(status: PageState.failure(failure.message!))),
      success: (_) => emit(state.copyWith(openTimeUpdated: true)),
    );
  }

  Future<void> updateRestaurantCloseTime(String closeTime) async {
    emit(state.copyWith(status: const PageState.loading()));
    final result = await _myRestaurantRepository.updateRestaurantCloseTime(
      closeTime,
    );

    result.when(
      failure: (failure) =>
          emit(state.copyWith(status: PageState.failure(failure.message!))),
      success: (_) => emit(state.copyWith(closeTimeUpdated: true)),
    );
  }

  void validateFields({
    required List<TextEditingController> controllers,
    required TimeOfDay? openTime,
    required TimeOfDay? closeTime,
  }) {
    bool allFieldsFilled = controllers.every(
      (controller) => controller.text.isNotEmpty,
    );
    bool hasValidTimes = openTime != null && closeTime != null;

    bool isValidTimeRange = false;

    if (hasValidTimes) {
      final int openMinutes = openTime.hour * 60 + openTime.minute;
      final int closeMinutes = closeTime.hour * 60 + closeTime.minute;
      final int duration = (closeMinutes >= openMinutes)
          ? closeMinutes - openMinutes
          : (1440 - openMinutes) + closeMinutes;

      if (openMinutes == closeMinutes) {
        isValidTimeRange = true;
      } else if (closeMinutes > openMinutes) {
        isValidTimeRange = true;
      } else if (closeMinutes < openMinutes) {
        isValidTimeRange = true;
      } else if (duration >= 30) {
        isValidTimeRange = true;
      }
    }

    _isValid = allFieldsFilled && hasValidTimes && isValidTimeRange;

    emit(state.copyWith(isValidate: _isValid));
  }

  void validateUpdateField(TextEditingController controller) {
    _isValid = controller.text.isNotEmpty;

    emit(state.copyWith(isValidate: _isValid));
  }

  void resetValidation() {
    _isValid = false;
    emit(state.copyWith(isValidate: _isValid));
  }
}

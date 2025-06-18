import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/features/my_restaurant/data/models/restaurant_model.dart';
import 'package:foodix/features/my_restaurant/data/repos/my_restaurant_repo.dart';

import 'my_restaurant_state.dart';

class MyRestaurantCubit extends Cubit<MyRestaurantState> {
  final MyRestaurantRepository _myRestaurantRepository;
  bool _isValid = false;

  MyRestaurantCubit(this._myRestaurantRepository) : super(MyRestaurantInit());

  Future<void> createRestaurant(RestaurantModel restaurant) async {
    emit(MyRestaurantLoading());
    final result = await _myRestaurantRepository.createRestaurant(restaurant);

    result.fold(
      (failure) => emit(MyRestaurantFailure(failure.errorMsg)),
      (_) => emit(MyRestaurantCreated()),
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

    emit(MyRestaurantValidationFields());
  }

  bool get isValid => _isValid;
}

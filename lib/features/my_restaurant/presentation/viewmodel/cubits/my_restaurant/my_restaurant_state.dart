import 'package:foodix/core/shared/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/restaurant_model.dart';

part 'my_restaurant_state.freezed.dart';

@freezed
sealed class MyRestaurantState with _$MyRestaurantState {
  const factory MyRestaurantState({
    @Default(PageState.init()) PageState<RestaurantModel> status,
    @Default(false) bool isValidate,
    @Default(false) bool nameUpdated,
    @Default(false) bool timeDeliveryUpdated,
    @Default(false) bool costDeliveryUpdated,
    @Default(false) bool openTimeUpdated,
    @Default(false) bool closeTimeUpdated,
  }) = _MyRestaurantState;
}

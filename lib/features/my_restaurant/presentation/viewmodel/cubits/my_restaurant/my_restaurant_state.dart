import '../../../../data/models/restaurant_model.dart';

sealed class MyRestaurantState {}

class MyRestaurantInit extends MyRestaurantState {}

class MyRestaurantLoading extends MyRestaurantState {}

class MyRestaurantCreated extends MyRestaurantState {
  final RestaurantModel restaurant;

  MyRestaurantCreated(this.restaurant);
}

class MyRestaurantValidationFields extends MyRestaurantState {}

class MyRestaurantNameUpdated extends MyRestaurantState {}

class MyRestaurantTimeDeliveryUpdated extends MyRestaurantState {}

class MyRestaurantCostDeliveryUpdated extends MyRestaurantState {}

class MyRestaurantOpenTimeUpdated extends MyRestaurantState {}

class MyRestaurantCloseTimeUpdated extends MyRestaurantState {}

class MyRestaurantFailure extends MyRestaurantState {
  final String errorMsg;

  MyRestaurantFailure(this.errorMsg);
}

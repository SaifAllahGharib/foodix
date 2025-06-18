sealed class MyRestaurantState {}

class MyRestaurantInit extends MyRestaurantState {}

class MyRestaurantLoading extends MyRestaurantState {}

class MyRestaurantCreated extends MyRestaurantState {}

class MyRestaurantValidationFields extends MyRestaurantState {}

class MyRestaurantFailure extends MyRestaurantState {
  final String errorMsg;

  MyRestaurantFailure(this.errorMsg);
}

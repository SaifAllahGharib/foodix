sealed class RestaurantState {}

class RestaurantInitState extends RestaurantState {}

class RestaurantSuccessState extends RestaurantState {}

class RestaurantFailureState extends RestaurantState {}

class RestaurantShowCategoryListViewState extends RestaurantState {
  final double appBarHeight;

  RestaurantShowCategoryListViewState(this.appBarHeight);
}

class RestaurantUpdateOpacityState extends RestaurantState {
  final double opacity;

  RestaurantUpdateOpacityState(this.opacity);
}

class RestaurantCounterState extends RestaurantState {}

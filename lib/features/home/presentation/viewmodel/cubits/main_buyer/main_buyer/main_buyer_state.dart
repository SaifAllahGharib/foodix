import '../../../../../../my_restaurant/data/models/restaurant_model.dart';

sealed class MainBuyerState {}

class MainBuyerInit extends MainBuyerState {}

class MainBuyerLoading extends MainBuyerState {}

class MainBuyerSuccess extends MainBuyerState {
  final List<RestaurantModel> data;

  MainBuyerSuccess(this.data);
}

class MainBuyerFailure extends MainBuyerState {
  final String message;

  MainBuyerFailure(this.message);
}

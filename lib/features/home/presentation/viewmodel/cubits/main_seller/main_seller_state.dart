import 'package:foodix/features/my_restaurant/data/models/restaurant_model.dart';  

import '../../../../../../core/shared/models/category_model.dart';  

abstract class MainSellerState {}

class MainSellerInit extends MainSellerState {}

class MainSellerLoading extends MainSellerState {}

class MainSellerAddCategory extends MainSellerState {}

class MainSellerGetCategory extends MainSellerState {
  final List<CategoryModel>? categories;

  MainSellerGetCategory(this.categories);
}

class MainSellerEnableButton extends MainSellerState {}

class MainSellerGetMyRestaurant extends MainSellerState {
  final RestaurantModel restaurant;

  MainSellerGetMyRestaurant(this.restaurant);
}

class MainSellerFailure extends MainSellerState {
  final String errorMsg;

  MainSellerFailure(this.errorMsg);
}

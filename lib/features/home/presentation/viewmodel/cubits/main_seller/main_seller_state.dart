import 'package:firebase_database/firebase_database.dart';
import 'package:foodix/features/my_restaurant/data/models/restaurant_model.dart';

abstract class MainSellerState {}

class MainSellerInit extends MainSellerState {}

class MainSellerLoading extends MainSellerState {}

class MainSellerSuccess extends MainSellerState {}

class MainSellerAddCategory extends MainSellerState {}

class MainSellerGetCategory extends MainSellerState {
  final DataSnapshot snapshot;

  MainSellerGetCategory(this.snapshot);
}

class MainSellerAddFood extends MainSellerState {}

class MainSellerEnableButton extends MainSellerState {}

class MainSellerGetMyRestaurant extends MainSellerState {
  final RestaurantModel restaurant;

  MainSellerGetMyRestaurant(this.restaurant);
}

class MainSellerFailure extends MainSellerState {
  final String errorMsg;

  MainSellerFailure(this.errorMsg);
}

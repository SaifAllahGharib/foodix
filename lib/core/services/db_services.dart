import 'package:firebase_database/firebase_database.dart';
import 'package:foodix/features/my_restaurant/data/models/restaurant_model.dart';

import '../shared/models/category_model.dart';
import '../shared/models/food_model.dart';
import '../shared/models/user_model.dart';

abstract class DBServices {
  Future<dynamic> getUser();

  Future<void> setUser(UserModel user);

  Future<void> updateName(String name);

  Future<void> addCategory(CategoryModel category);

  Future<void> addFood(String categoryName, FoodModel food);

  Stream<dynamic> getCategories();

  Future<void> createRestaurant(RestaurantModel restaurant);

  Future<DataSnapshot> getRestaurants();

  Future<DataSnapshot?> getMyRestaurants();
}

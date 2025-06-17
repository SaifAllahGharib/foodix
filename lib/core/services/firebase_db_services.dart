import 'package:firebase_database/firebase_database.dart';
import 'package:foodix/core/services/db_services.dart';
import 'package:foodix/core/services/firebase_service.dart';

import '../../features/home/data/models/restaurant_model.dart';
import '../shared/models/category_model.dart';
import '../shared/models/food_model.dart';
import '../shared/models/user_model.dart';

class FirebaseDBServices extends DBServices {
  final FirebaseService _firebaseService;

  FirebaseDBServices(this._firebaseService);

  @override
  Future<DataSnapshot> getUser() async {
    return await _firebaseService.db
        .ref()
        .child("users")
        .child(_firebaseService.auth.currentUser!.uid)
        .get();
  }

  @override
  Future<void> setUser(UserModel user) async {
    await _firebaseService.db
        .ref()
        .child("users")
        .child(_firebaseService.auth.currentUser!.uid)
        .set(user.toJson());
  }

  @override
  Future<void> updateName(String name) async {
    await _firebaseService.db
        .ref()
        .child("users/$_firebaseService.auth.currentUser!.uid")
        .update({"name": name});
  }

  @override
  Future<void> addCategory(CategoryModel category) async {
    await _firebaseService.db
        .ref()
        .child("restaurants")
        .child(_firebaseService.auth.currentUser!.uid)
        .child("categories")
        .child(category.categoryName!)
        .set(category.toJson());
  }

  @override
  Future<void> addFood(String categoryName, FoodModel food) async {
    await _firebaseService.db
        .ref()
        .child("restaurants")
        .child(_firebaseService.auth.currentUser!.uid)
        .child("categories")
        .child(categoryName)
        .child("foods")
        .child(food.foodName)
        .set(food.toJson());
  }

  @override
  Stream<DataSnapshot> getCategories() {
    return _firebaseService.db
        .ref()
        .child("restaurants")
        .child(_firebaseService.auth.currentUser!.uid)
        .child("categories")
        .onValue
        .map((event) => event.snapshot);
  }

  @override
  Future<void> createRestaurant(RestaurantModel restaurant) async {
    await _firebaseService.db
        .ref()
        .child("restaurants")
        .child(_firebaseService.auth.currentUser!.uid)
        .set(restaurant.toJson());
  }

  @override
  Future<DataSnapshot> getRestaurants() async {
    return await _firebaseService.db.ref().child("restaurants").get();
  }
}

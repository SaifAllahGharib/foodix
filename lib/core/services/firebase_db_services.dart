import 'package:firebase_database/firebase_database.dart';
import 'package:foodix/core/services/db_services.dart';
import 'package:foodix/core/services/firebase_service.dart';

import '../../features/my_restaurant/data/models/restaurant_model.dart';
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
        .child("users")
        .child(_firebaseService.auth.currentUser!.uid)
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
        .child(restaurant.id!)
        .set(restaurant.toJson());
  }

  @override
  Future<DataSnapshot> getRestaurants() async {
    return await _firebaseService.db.ref().child("restaurants").get();
  }

  @override
  Future<DataSnapshot?> getMyRestaurants() async {
    return await _firebaseService.db
        .ref()
        .child("restaurants")
        .child(_firebaseService.auth.currentUser!.uid)
        .get();
  }

  @override
  Future<void> updateRestaurantCloseTime(String closeTime) async {
    await _firebaseService.db
        .ref()
        .child("restaurants")
        .child(_firebaseService.auth.currentUser!.uid)
        .update({"closeTime": closeTime});
  }

  @override
  Future<void> updateRestaurantCostDelivery(int cost) async {
    await _firebaseService.db
        .ref()
        .child("restaurants")
        .child(_firebaseService.auth.currentUser!.uid)
        .update({"deliveryCost": cost});
  }

  @override
  Future<void> updateRestaurantName(String name) async {
    await _firebaseService.db
        .ref()
        .child("restaurants")
        .child(_firebaseService.auth.currentUser!.uid)
        .update({"name": name});
  }

  @override
  Future<void> updateRestaurantOpenTime(String openTime) async {
    await _firebaseService.db
        .ref()
        .child("restaurants")
        .child(_firebaseService.auth.currentUser!.uid)
        .update({"openTime": openTime});
  }

  @override
  Future<void> updateRestaurantTimeDelivery(int time) async {
    await _firebaseService.db
        .ref()
        .child("restaurants")
        .child(_firebaseService.auth.currentUser!.uid)
        .update({"deliveryTime": time});
  }
}

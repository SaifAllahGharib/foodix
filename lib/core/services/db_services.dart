import '../shared/models/ProductModel.dart';
import '../shared/models/food_model.dart';
import '../shared/models/user_model.dart';

abstract class DBServices {
  Future<dynamic> getUser();

  Future<void> setUser(UserModel user);

  Future<void> updateName(String name);

  Future<void> addCategory(ProductModel product);

  Future<void> addFood(String categoryName, FoodModel food);

  Stream<dynamic> getCategories();

  Future<void> createRestaurant(String restaurantName);
}

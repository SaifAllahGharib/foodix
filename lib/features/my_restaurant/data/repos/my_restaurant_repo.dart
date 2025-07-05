import 'package:failure_handler/failure_handler.dart';

import '../../../../core/utils/result.dart';
import '../models/restaurant_model.dart';

abstract class MyRestaurantRepository {
  Future<Result<AppFailure, void>> createRestaurant(RestaurantModel restaurant);

  Future<Result<AppFailure, void>> updateRestaurantName(String name);

  Future<Result<AppFailure, void>> updateRestaurantTimeDelivery(int time);

  Future<Result<AppFailure, void>> updateRestaurantCostDelivery(int cost);

  Future<Result<AppFailure, void>> updateRestaurantOpenTime(String openTime);

  Future<Result<AppFailure, void>> updateRestaurantCloseTime(String closeTime);
}

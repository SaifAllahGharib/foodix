import 'package:failure_handler/failure_handler.dart';  
import 'package:foodix/features/my_restaurant/data/models/restaurant_model.dart';  

import '../../../../core/services/db_services.dart';  
import '../../../../core/utils/result.dart';  
import 'my_restaurant_repo.dart';  

class MyRestaurantRepositoryImp implements MyRestaurantRepository {
  final DBServices _dbServices;

  MyRestaurantRepositoryImp(this._dbServices);

  @override
  Future<Result<AppFailure, void>> createRestaurant(
    RestaurantModel restaurant,
  ) async {
    try {
      return Success(await _dbServices.createRestaurant(restaurant));
    } catch (e) {
      return Failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Result<AppFailure, void>> updateRestaurantCloseTime(
    String closeTime,
  ) async {
    try {
      return Success(await _dbServices.updateRestaurantCloseTime(closeTime));
    } catch (e) {
      return Failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Result<AppFailure, void>> updateRestaurantCostDelivery(
    int cost,
  ) async {
    try {
      return Success(await _dbServices.updateRestaurantCostDelivery(cost));
    } catch (e) {
      return Failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Result<AppFailure, void>> updateRestaurantName(String name) async {
    try {
      return Success(await _dbServices.updateRestaurantName(name));
    } catch (e) {
      return Failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Result<AppFailure, void>> updateRestaurantOpenTime(
    String openTime,
  ) async {
    try {
      return Success(await _dbServices.updateRestaurantOpenTime(openTime));
    } catch (e) {
      return Failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Result<AppFailure, void>> updateRestaurantTimeDelivery(
    int time,
  ) async {
    try {
      return Success(await _dbServices.updateRestaurantTimeDelivery(time));
    } catch (e) {
      return Failure(ErrorHandler.handle(e));
    }
  }
}

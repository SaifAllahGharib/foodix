import 'package:dartz/dartz.dart';
import 'package:foodix/core/errors/failure.dart';
import 'package:foodix/core/services/db_services.dart';
import 'package:foodix/features/my_restaurant/data/models/restaurant_model.dart';

import 'my_restaurant_repo.dart';

class MyRestaurantRepositoryImp implements MyRestaurantRepository {
  final DBServices _dbServices;

  MyRestaurantRepositoryImp(this._dbServices);

  Future<Either<Failure, void>> _handleError(
    Future<void> Function() operation,
  ) async {
    try {
      await operation();
      return right(unit);
    } catch (e) {
      if (e is FirebaseDBFailure) {
        return left(FirebaseDBFailure(e.errorMsg));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> createRestaurant(
    RestaurantModel restaurant,
  ) async {
    return _handleError(() => _dbServices.createRestaurant(restaurant));
  }

  @override
  Future<Either<Failure, void>> updateRestaurantCloseTime(String closeTime) {
    return _handleError(() => _dbServices.updateRestaurantCloseTime(closeTime));
  }

  @override
  Future<Either<Failure, void>> updateRestaurantCostDelivery(int cost) {
    return _handleError(() => _dbServices.updateRestaurantCostDelivery(cost));
  }

  @override
  Future<Either<Failure, void>> updateRestaurantName(String name) {
    return _handleError(() => _dbServices.updateRestaurantName(name));
  }

  @override
  Future<Either<Failure, void>> updateRestaurantOpenTime(String openTime) {
    return _handleError(() => _dbServices.updateRestaurantOpenTime(openTime));
  }

  @override
  Future<Either<Failure, void>> updateRestaurantTimeDelivery(int time) {
    return _handleError(() => _dbServices.updateRestaurantTimeDelivery(time));
  }
}

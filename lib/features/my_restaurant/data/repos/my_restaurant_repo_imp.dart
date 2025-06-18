import 'package:dartz/dartz.dart';
import 'package:foodix/core/errors/failure.dart';
import 'package:foodix/core/services/db_services.dart';
import 'package:foodix/features/my_restaurant/data/models/restaurant_model.dart';

import 'my_restaurant_repo.dart';

class MyRestaurantRepositoryImp implements MyRestaurantRepository {
  final DBServices _dbServices;

  MyRestaurantRepositoryImp(this._dbServices);

  @override
  Future<Either<Failure, void>> createRestaurant(
    RestaurantModel restaurant,
  ) async {
    try {
      return right(await _dbServices.createRestaurant(restaurant));
    } catch (e) {
      if (e is FirebaseDBFailure) {
        return left(FirebaseDBFailure(e.errorMsg));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }
}

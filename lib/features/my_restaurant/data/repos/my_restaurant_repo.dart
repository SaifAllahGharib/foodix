import 'package:dartz/dartz.dart';
import 'package:foodix/core/errors/failure.dart';
import 'package:foodix/features/my_restaurant/data/models/restaurant_model.dart';

abstract class MyRestaurantRepository {
  Future<Either<Failure, void>> createRestaurant(RestaurantModel restaurant);
}

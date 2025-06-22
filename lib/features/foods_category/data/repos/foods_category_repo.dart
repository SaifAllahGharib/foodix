import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../../core/errors/failure.dart';

abstract class FoodsCategoryRepository {
  Stream<Either<Failure, DataSnapshot>> getFoodsCategory(String categoryName);
}

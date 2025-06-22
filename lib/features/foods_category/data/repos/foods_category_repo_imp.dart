import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:foodix/core/errors/failure.dart';

import '../../../../core/services/db_services.dart';
import 'foods_category_repo.dart';

class FoodsCategoryRepositoryImp implements FoodsCategoryRepository {
  final DBServices _dbServices;

  FoodsCategoryRepositoryImp(this._dbServices);

  @override
  Stream<Either<Failure, DataSnapshot>> getFoodsCategory(String categoryName) {
    return _dbServices.getFoodsCategory(categoryName).map((snapshot) {
      try {
        return right(snapshot);
      } catch (e) {
        return left(
          FirebaseDBFailure(e is FirebaseDBFailure ? e.errorMsg : e.toString()),
        );
      }
    });
  }
}

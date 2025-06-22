import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:foodix/core/errors/failure.dart';
import 'package:foodix/core/services/db_services.dart';
import 'package:foodix/features/home/data/repos/main_seller/main_seller_repo.dart';

import '../../../../../core/shared/models/category_model.dart';

class MainSellerRepositoryImp extends MainSellerRepository {
  final DBServices _dbServices;

  MainSellerRepositoryImp(this._dbServices);

  @override
  Future<Either<Failure, void>> addCategory(CategoryModel category) async {
    try {
      return right(await _dbServices.addCategory(category));
    } catch (e) {
      if (e is FirebaseDBFailure) {
        return left(FirebaseDBFailure(e.errorMsg));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Stream<Either<Failure, DataSnapshot>> getCategories() {
    return _dbServices.getCategories().map((snapshot) {
      try {
        return right(snapshot);
      } catch (e) {
        return left(
          FirebaseDBFailure(e is FirebaseDBFailure ? e.errorMsg : e.toString()),
        );
      }
    });
  }

  @override
  Future<Either<Failure, DataSnapshot?>> getMyRestaurant() async {
    try {
      return right(await _dbServices.getMyRestaurants());
    } catch (e) {
      if (e is FirebaseDBFailure) {
        return left(FirebaseDBFailure(e.errorMsg));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }
}

import 'package:failure_handler/failure_handler.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:foodix/features/home/data/repos/main_seller/main_seller_repo.dart';

import '../../../../../core/services/db_services.dart';
import '../../../../../core/shared/models/category_model.dart';
import '../../../../../core/utils/result.dart';

class MainSellerRepositoryImp extends MainSellerRepository {
  final DBServices _dbServices;

  MainSellerRepositoryImp(this._dbServices);

  @override
  Future<Result<AppFailure, void>> addCategory(CategoryModel category) async {
    try {
      return Success(await _dbServices.addCategory(category));
    } catch (e) {
      return Failure(ErrorHandler.handle(e));
    }
  }

  @override
  Stream<Result<AppFailure, DataSnapshot>> getCategories() {
    return _dbServices.getCategories().map((snapshot) {
      try {
        return Success(snapshot);
      } catch (e) {
        return Failure(ErrorHandler.handle(e));
      }
    });
  }

  @override
  Future<Result<AppFailure, DataSnapshot?>> getMyRestaurant() async {
    try {
      return Success(await _dbServices.getMyRestaurants());
    } catch (e) {
      return Failure(ErrorHandler.handle(e));
    }
  }
}

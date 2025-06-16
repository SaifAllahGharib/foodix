import 'package:dartz/dartz.dart';
import 'package:foodix/core/errors/failure.dart';
import 'package:foodix/core/services/db_services.dart';
import 'package:foodix/features/home/data/repos/main_seller/main_seller_repo.dart';

import '../../../../../core/shared/models/ProductModel.dart';

class MainSellerRepositoryImp extends MainSellerRepository {
  final DBServices _dbServices;

  MainSellerRepositoryImp(this._dbServices);

  @override
  Future<Either<Failure, void>> addCategory(ProductModel product) async {
    try {
      return right(await _dbServices.addCategory(product));
    } catch (e) {
      if (e is FirebaseDBFailure) {
        return left(FirebaseDBFailure(e.errorMsg));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Stream<Either<Failure, dynamic>> getCategories() {
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
}

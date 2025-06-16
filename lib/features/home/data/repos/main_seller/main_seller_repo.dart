import 'package:dartz/dartz.dart';
import 'package:foodix/core/errors/failure.dart';

import '../../../../../core/shared/models/ProductModel.dart';

abstract class MainSellerRepository {
  Future<Either<Failure, void>> addCategory(ProductModel product);

  Stream<Either<Failure, dynamic>> getCategories();
}

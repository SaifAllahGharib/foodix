import 'package:firebase_database/firebase_database.dart';

import '../../../../../core/shared/models/category_model.dart';

abstract class MainSellerRepository {
  Future<Either<Failure, void>> addCategory(CategoryModel category);

  Stream<Either<Failure, DataSnapshot>> getCategories();

  Future<Either<Failure, DataSnapshot?>> getMyRestaurant();
}

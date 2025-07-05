import 'package:failure_handler/failure_handler.dart';  
import 'package:firebase_database/firebase_database.dart';  

import '../../../../../core/shared/models/category_model.dart';  
import '../../../../../core/utils/result.dart';  

abstract class MainSellerRepository {
  Future<Result<AppFailure, void>> addCategory(CategoryModel category);

  Stream<Result<AppFailure, DataSnapshot>> getCategories();

  Future<Result<AppFailure, DataSnapshot?>> getMyRestaurant();
}

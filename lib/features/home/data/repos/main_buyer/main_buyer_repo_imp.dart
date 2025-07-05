import 'package:failure_handler/failure_handler.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:foodix/core/services/db_services.dart';

import '../../../../../core/utils/result.dart';
import 'main_buyer_repo.dart';

class MainBuyerRepoImp implements MainBuyerRepo {
  final DBServices _dbServices;

  MainBuyerRepoImp(this._dbServices);

  @override
  Future<Result<AppFailure, DataSnapshot>> getRestaurants() async {
    try {
      return Success(await _dbServices.getRestaurants());
    } catch (e) {
      return Failure(ErrorHandler.handle(e));
    }
  }
}

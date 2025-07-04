import 'package:firebase_database/firebase_database.dart';
import 'package:foodix/core/services/db_services.dart';
import 'main_buyer_repo.dart';

class MainBuyerRepoImp implements MainBuyerRepo {
  final DBServices _dbServices;

  MainBuyerRepoImp(this._dbServices);

  @override
  Future<Either<Failure, DataSnapshot>> getRestaurants() async {
    try {
      return right(await _dbServices.getRestaurants());
    } catch (e) {
      if (e is FirebaseDBFailure) {
        return left(FirebaseDBFailure(e.errorMsg));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }
}

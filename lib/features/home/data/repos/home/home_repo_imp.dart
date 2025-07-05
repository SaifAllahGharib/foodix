import 'package:failure_handler/failure_handler.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:foodix/features/home/data/repos/home/home_repo.dart';

import '../../../../../core/services/db_services.dart';
import '../../../../../core/utils/result.dart';

class HomeRepositoryImp extends HomeRepository {
  final DBServices _dbServices;

  HomeRepositoryImp(this._dbServices);

  @override
  Future<Result<AppFailure, DataSnapshot>> getUser() async {
    try {
      return Success(await _dbServices.getUser());
    } catch (e) {
      return Failure(ErrorHandler.handle(e));
    }
  }
}

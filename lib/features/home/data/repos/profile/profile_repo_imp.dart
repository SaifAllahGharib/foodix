import 'package:failure_handler/failure_handler.dart';  
import 'package:foodix/core/services/db_services.dart';  
import 'package:foodix/features/home/data/repos/profile/profile_repo.dart';  

import '../../../../../core/services/auth_services.dart';  
import '../../../../../core/utils/result.dart';  

class ProfileRepositoryImp extends ProfileRepository {
  final AuthServices _authServices;
  final DBServices _dbServices;

  ProfileRepositoryImp(this._authServices, this._dbServices);

  @override
  Future<Result<AppFailure, void>> signOut() async {
    try {
      return Success(await _authServices.signOut());
    } catch (e) {
      return Failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Result<AppFailure, void>> updateName(String name) async {
    try {
      return Success(await _dbServices.updateName(name));
    } catch (e) {
      return Failure(ErrorHandler.handle(e));
    }
  }
}

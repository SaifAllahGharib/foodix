 
import 'package:firebase_auth/firebase_auth.dart';ices/auth_services.dart';
import 'package:foodix/core/services/db_services.dart';
import 'package:foodix/features/home/data/repos/profile/profile_repo.dart';

class ProfileRepositoryImp extends ProfileRepository {
  final AuthServices _authServices;
  final DBServices _dbServices;

  ProfileRepositoryImp(this._authServices, this._dbServices);

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      return right(await _authServices.signOut());
    } on FirebaseAuthException catch (e) {
      return left(FirebaseAuthFailure(e.code));
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateName(String name) async {
    try {
      return right(await _dbServices.updateName(name));
    } on FirebaseAuthException catch (e) {
      return left(FirebaseAuthFailure(e.code));
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }
}

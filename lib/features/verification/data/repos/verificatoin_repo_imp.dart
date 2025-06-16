import 'package:dartz/dartz.dart';
import 'package:foodix/core/errors/failure.dart';
import 'package:foodix/core/services/auth_services.dart';
import 'package:foodix/features/verification/data/repos/verificarion_repo.dart';

class VerificationRepositoryImp extends VerificationRepository {
  final AuthServices _authServices;

  VerificationRepositoryImp(this._authServices);

  @override
  Future<Either<Failure, void>> sendEmailVerification() async {
    try {
      return right(await _authServices.sendEmailVerification());
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isEmailVerified() async {
    try {
      return right(await _authServices.isEmailVerified());
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }
}

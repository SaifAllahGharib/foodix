import 'package:dartz/dartz.dart';

abstract class VerificationRepository {
  Future<Either<Failure, void>> sendEmailVerification();

  Future<Either<Failure, bool>> isEmailVerified();
}

import 'package:dartz/dartz.dart';
import 'package:foodix/core/errors/failure.dart';

abstract class VerificationRepository {
  Future<Either<Failure, void>> sendEmailVerification();

  Future<Either<Failure, bool>> isEmailVerified();
}

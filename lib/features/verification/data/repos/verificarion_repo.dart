abstract class VerificationRepository {
  Future<Either<Failure, void>> sendEmailVerification();

  Future<Either<Failure, bool>> isEmailVerified();
}

import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, void>> updateName(String name);
}

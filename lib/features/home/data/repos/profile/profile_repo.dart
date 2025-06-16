import 'package:dartz/dartz.dart';
import 'package:foodix/core/errors/failure.dart';

abstract class ProfileRepository {
  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, void>> updateName(String name);
}

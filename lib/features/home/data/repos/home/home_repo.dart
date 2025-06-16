import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:foodix/core/errors/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, DataSnapshot>> getUser();
}

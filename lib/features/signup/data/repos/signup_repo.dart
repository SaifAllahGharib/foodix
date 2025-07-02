import 'package:dartz/dartz.dart';

import 'package:foodix/features/signup/data/models/signup_model.dart';

abstract class SignupRepository {
  Future<Either<Failure, String>> signup(
    SignupModel user,
    String successMsg,
    String fieldMsg,
  );
}

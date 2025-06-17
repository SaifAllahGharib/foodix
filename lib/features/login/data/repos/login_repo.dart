import 'package:dartz/dartz.dart';
import 'package:foodix/core/errors/failure.dart';
import 'package:foodix/features/login/data/models/login_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>> login(
    LoginModel user,
    String successMsg,
    String fieldMsg,
  );
}

import 'package:dartz/dartz.dart';

import '../../../../core/shared/models/response.dart';

abstract class ForgetPasswordRepository {
  Future<Either<Failure, ResponseModel>> forgetPassword(String email);
}

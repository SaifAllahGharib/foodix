import 'package:failure_handler/failure_handler.dart';  

import '../../../../core/utils/result.dart';  
import '../models/signup_model.dart';  

abstract class SignupRepository {
  Future<Result<AppFailure, String>> signup(
    SignupModel user,
    String successMsg,
    String fieldMsg,
  );
}

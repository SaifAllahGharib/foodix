import 'package:failure_handler/failure_handler.dart';  

import '../../../../core/utils/result.dart';  
import '../models/login_model.dart';  

abstract class LoginRepository {
  Future<Result<AppFailure, String>> login(
    LoginModel user,
    String successMsg,
    String fieldMsg,
  );
}

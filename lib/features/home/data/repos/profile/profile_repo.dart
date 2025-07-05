import 'package:failure_handler/failure_handler.dart';

import '../../../../../core/utils/result.dart';

abstract class ProfileRepository {
  Future<Result<AppFailure, void>> signOut();

  Future<Result<AppFailure, void>> updateName(String name);
}

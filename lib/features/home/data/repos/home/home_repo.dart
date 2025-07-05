import 'package:failure_handler/failure_handler.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../../../core/utils/result.dart';

abstract class HomeRepository {
  Future<Result<AppFailure, DataSnapshot>> getUser();
}

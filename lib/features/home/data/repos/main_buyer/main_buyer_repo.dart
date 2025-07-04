import 'package:firebase_database/firebase_database.dart';

abstract class MainBuyerRepo {
  Future<Either<Failure, DataSnapshot>> getRestaurants();
}

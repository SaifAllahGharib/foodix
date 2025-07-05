import 'package:firebase_auth/firebase_auth.dart';  
import 'package:firebase_database/firebase_database.dart';  

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase _db = FirebaseDatabase.instance;

  FirebaseService._privateConstructor();

  static final FirebaseService _instance =
      FirebaseService._privateConstructor();

  factory FirebaseService() {
    return _instance;
  }

  FirebaseAuth get auth => _auth;

  FirebaseDatabase get db => _db;
}

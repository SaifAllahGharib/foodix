import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodix/features/login/data/models/login_model.dart';
import 'package:foodix/features/signup/data/models/signup_model.dart';

abstract class AuthServices {
  Future<UserCredential> signUp(SignupModel user);

  Future<UserCredential> login(LoginModel user);

  Future<void> signOut();

  Future<void> sendEmailVerification();

  Future<bool> isEmailVerified();

  Future<void> resetPassword({required String email});
}

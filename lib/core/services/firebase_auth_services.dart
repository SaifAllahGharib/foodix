import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodix/core/services/auth_services.dart';
import 'package:foodix/core/services/firebase_service.dart';
import 'package:foodix/features/login/data/models/login_model.dart';
import 'package:foodix/features/signup/data/models/signup_model.dart';

class FirebaseAuthServices extends AuthServices {
  final FirebaseService _firebaseService;

  FirebaseAuthServices(this._firebaseService);

  @override
  Future<UserCredential> signUp(SignupModel user) async {
    final response = await _firebaseService.auth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );

    return response;
  }

  @override
  Future<UserCredential> login(LoginModel user) async {
    final response = await _firebaseService.auth.signInWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );

    return response;
  }

  @override
  Future<void> resetPassword({required String email}) async {}

  @override
  Future<void> signOut() async {
    await _firebaseService.auth.signOut();
  }

  @override
  Future<void> sendEmailVerification() async {
    var user = _firebaseService.auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  @override
  Future<bool> isEmailVerified() async {
    var user = _firebaseService.auth.currentUser;
    await user?.reload();
    return user?.emailVerified ?? false;
  }
}

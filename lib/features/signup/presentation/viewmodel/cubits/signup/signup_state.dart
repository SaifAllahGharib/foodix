import 'package:foodix/core/errors/failure.dart';

abstract class SignupState {}

class SignupInit extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final String msg;

  SignupSuccess(this.msg);
}

class SignupFailure extends SignupState {
  final Failure failure;

  SignupFailure(this.failure);
}

class SignupShowPassword extends SignupState {
  final bool showPassword;

  SignupShowPassword(this.showPassword);
}

class SignupButtonIsEnabled extends SignupState {
  final bool buttonEnabled;

  SignupButtonIsEnabled(this.buttonEnabled);
}

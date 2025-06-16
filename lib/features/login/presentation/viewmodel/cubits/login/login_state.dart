import 'package:foodix/core/errors/failure.dart';

sealed class LoginState {}

class LoginInit extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String msg;

  LoginSuccess(this.msg);
}

class LoginFailure extends LoginState {
  final Failure failure;

  LoginFailure(this.failure);
}

class LoginShowPassword extends LoginState {
  final bool showPassword;

  LoginShowPassword(this.showPassword);
}

class LoginButtonIsEnabled extends LoginState {
  final bool buttonEnabled;

  LoginButtonIsEnabled(this.buttonEnabled);
}

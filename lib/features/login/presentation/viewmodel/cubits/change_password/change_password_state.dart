import '../../../../../../core/shared/models/response.dart';

abstract class ChangePasswordState {}

class ChangePasswordInit extends ChangePasswordState {}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {
  final ResponseModel response;

  ChangePasswordSuccess(this.response);
}

class ChangePasswordFailure extends ChangePasswordState {
  final String errorMsg;

  ChangePasswordFailure(this.errorMsg);
}

class ChangePasswordShowPassword extends ChangePasswordState {
  final bool showPassword;

  ChangePasswordShowPassword(this.showPassword);
}

class ChangePasswordButtonIsEnabled extends ChangePasswordState {
  final bool buttonEnabled;

  ChangePasswordButtonIsEnabled(this.buttonEnabled);
}

import '../../../../../../core/shared/models/response.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordInit extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final ResponseModel response;

  ForgetPasswordSuccess(this.response);
}

class ForgetPasswordFailure extends ForgetPasswordState {
  final String errorMsg;

  ForgetPasswordFailure(this.errorMsg);
}

class ForgetPasswordButtonIsEnabled extends ForgetPasswordState {
  final bool isEnabled;

  ForgetPasswordButtonIsEnabled(this.isEnabled);
}

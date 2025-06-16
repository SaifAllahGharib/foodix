import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/functions/is_valid_email.dart';
import 'package:foodix/features/login/presentation/viewmodel/cubits/forget_password/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  // final ForgetPasswordRepository _forgetPasswordRepository;
  bool _buttonEnabled = false;

  ForgetPasswordCubit() : super(ForgetPasswordInit());

  Future<void> forgetPassword(String email) async {
    // emit(ForgetPasswordLoading());
    //
    // var result = await _forgetPasswordRepository.forgetPassword(email);
    //
    // result.fold(
    //   (e) => emit(ForgetPasswordFailure(e.errorMsg)),
    //   (email) => emit(ForgetPasswordSuccess(email)),
    // );
  }

  void validationFields({required TextEditingController email}) {
    _buttonEnabled = email.text.isNotEmpty && isValidEmail(email.text);
    emit(ForgetPasswordButtonIsEnabled(_buttonEnabled));
  }

  bool get buttonEnabled => _buttonEnabled;
}

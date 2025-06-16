import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/features/login/data/models/change_password_model.dart';
import 'package:foodix/features/login/presentation/viewmodel/cubits/change_password/change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  // final ChangePasswordRepository _changePasswordRepository;
  bool _showPassword = true;
  bool _buttonEnabled = false;

  ChangePasswordCubit() : super(ChangePasswordInit());

  Future<void> changePassword(ChangePasswordModel changePassword) async {
    // emit(ChangePasswordLoading());
    // var result = await _changePasswordRepository.changePassword(changePassword);
    //
    // result.fold(
    //   (e) => emit(ChangePasswordFailure(e.errorMsg)),
    //   (password) => emit(ChangePasswordSuccess(password)),
    // );
  }

  void togglePasswordVisibility() {
    _showPassword = !_showPassword;
    emit(ChangePasswordShowPassword(_showPassword));
  }

  void validationFields({
    required TextEditingController changePassword,
    required TextEditingController confirmPassword,
  }) {
    String p1 = changePassword.text;
    String p2 = confirmPassword.text;

    _buttonEnabled = p1.isNotEmpty && p2.isNotEmpty && p1 == p2;
    emit(ChangePasswordButtonIsEnabled(_buttonEnabled));
  }

  bool get showPassword => _showPassword;

  bool get buttonEnabled => _buttonEnabled;
}

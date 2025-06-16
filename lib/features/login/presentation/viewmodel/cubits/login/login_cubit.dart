import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/functions/is_valid_email.dart';
import 'package:foodix/features/login/data/models/login_model.dart';
import 'package:foodix/features/login/data/repos/login_repo.dart';
import 'package:foodix/features/login/presentation/viewmodel/cubits/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;
  bool _showPassword = true;
  bool _buttonEnabled = false;

  LoginCubit(this._loginRepository) : super(LoginInit());

  Future<void> login(LoginModel user, BuildContext context) async {
    emit(LoginLoading());
    var response = await _loginRepository.login(user, context);

    response.fold(
      (e) => emit(LoginFailure(e)),
      (user) => emit(LoginSuccess(user)),
    );
  }

  void togglePasswordVisibility() {
    _showPassword = !_showPassword;
    emit(LoginShowPassword(_showPassword));
  }

  void validationFields({
    required TextEditingController email,
    required TextEditingController password,
  }) {
    _buttonEnabled = email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        isValidEmail(email.text);
    emit(LoginButtonIsEnabled(_buttonEnabled));
  }

  bool get showPassword => _showPassword;

  bool get buttonEnabled => _buttonEnabled;
}

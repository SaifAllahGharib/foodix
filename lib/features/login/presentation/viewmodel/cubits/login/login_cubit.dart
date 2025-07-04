import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/shared/functions/email_validator.dart';
import 'package:foodix/core/shared/page_state.dart';
import 'package:foodix/features/login/data/models/login_model.dart';
import 'package:foodix/features/login/data/repos/login_repo.dart';
import 'package:foodix/features/login/presentation/viewmodel/cubits/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;

  LoginCubit(this._loginRepository) : super(const LoginState());

  Future<void> login(
    LoginModel user,
    String successMsg,
    String fieldMsg,
  ) async {
    emit(state.copyWith(status: const PageState.loading()));
    var response = await _loginRepository.login(user, successMsg, fieldMsg);

    response.when(
      failure: (failure) =>
          emit(state.copyWith(status: PageState.failure(failure.message!))),
      success: (msg) => emit(state.copyWith(status: const PageState.loading())),
    );
  }

  void validationFields({
    required TextEditingController email,
    required TextEditingController password,
  }) {
    bool buttonEnabled =
        email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        emailValidator(email.text);
    emit(state.copyWith(buttonEnabled: buttonEnabled));
  }
}

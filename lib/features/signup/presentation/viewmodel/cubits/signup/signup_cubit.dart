import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/shared/functions/email_validator.dart';
import 'package:foodix/core/shared/page_state.dart';
import 'package:foodix/features/signup/data/models/signup_model.dart';
import 'package:foodix/features/signup/data/repos/signup_repo.dart';
import 'package:foodix/features/signup/presentation/viewmodel/cubits/signup/signup_state.dart';

import '../../../../../../core/shared/functions/phone_validator.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepository _signupRepository;

  SignupCubit(this._signupRepository) : super(const SignupState());

  Future<void> signup(
    SignupModel user,
    String successMsg,
    String fieldMsg,
  ) async {
    emit(state.copyWith(status: const PageState.loading()));
    final result = await _signupRepository.signup(user, successMsg, fieldMsg);

    result.when(
      failure: (failure) =>
          emit(state.copyWith(status: PageState.failure(failure.message!))),
      success: (msg) =>
          emit(state.copyWith(status: const PageState.success(), msg: msg)),
    );
  }

  void validationFields({
    required TextEditingController name,
    required TextEditingController email,
    required TextEditingController phone,
    required TextEditingController password,
    required String userType,
  }) {
    bool buttonEnabled =
        name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        password.text.isNotEmpty &&
        emailValidator(email.text) &&
        phoneValidator(phone.text) &&
        userType.isNotEmpty;
    emit(state.copyWith(buttonEnabled: buttonEnabled));
  }
}

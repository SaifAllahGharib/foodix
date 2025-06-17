import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/functions/is_valid_email.dart';
import 'package:foodix/core/utils/functions/is_valid_phone.dart';
import 'package:foodix/features/signup/data/models/signup_model.dart';
import 'package:foodix/features/signup/data/repos/signup_repo.dart';
import 'package:foodix/features/signup/presentation/viewmodel/cubits/signup/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepository _signupRepository;
  bool _showPassword = true;
  bool _buttonEnabled = false;

  SignupCubit(this._signupRepository) : super(SignupInit());

  Future<void> signup(
    SignupModel user,
    String successMsg,
    String fieldMsg,
  ) async {
    emit(SignupLoading());
    final result = await _signupRepository.signup(user, successMsg, fieldMsg);

    result.fold(
      (failure) => emit(SignupFailure(failure)),
      (msg) => emit(SignupSuccess(msg)),
    );
  }

  void togglePasswordVisibility() {
    _showPassword = !_showPassword;
    emit(SignupShowPassword(_showPassword));
  }

  void validationFields({
    required TextEditingController name,
    required TextEditingController email,
    required TextEditingController phone,
    required TextEditingController password,
    required String userType,
  }) {
    _buttonEnabled =
        name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        password.text.isNotEmpty &&
        isValidEmail(email.text) &&
        isValidPhone(phone.text) &&
        userType.isNotEmpty;
    emit(SignupButtonIsEnabled(_buttonEnabled));
  }

  bool get showPassword => _showPassword;

  bool get buttonEnabled => _buttonEnabled;
}

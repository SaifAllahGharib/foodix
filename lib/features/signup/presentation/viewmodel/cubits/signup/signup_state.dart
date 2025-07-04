import 'package:foodix/core/shared/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
sealed class SignupState with _$SignupState {
  const factory SignupState({
    @Default(PageState.init()) PageState status,
    @Default(false) bool buttonEnabled,
    @Default("") String msg,
  }) = _SignupState;
}

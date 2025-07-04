import 'package:foodix/core/shared/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState({
    @Default(PageState.init()) PageState status,
    @Default(false) bool buttonEnabled,
  }) = _LoginState;
}

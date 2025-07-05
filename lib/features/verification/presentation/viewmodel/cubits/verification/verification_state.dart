import 'package:foodix/core/shared/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_state.freezed.dart';

@freezed
sealed class VerificationState with _$VerificationState {
  const factory VerificationState({
    @Default(PageState.init()) PageState<bool> status,
    @Default(false) bool isEmailVerificationSend,
    @Default(60) int time,
    @Default(false) bool canSend,
  }) = _VerificationState;
}

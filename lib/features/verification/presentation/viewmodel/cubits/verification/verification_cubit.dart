import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/shared/page_state.dart';
import 'package:foodix/features/verification/data/repos/verificarion_repo.dart';
import 'package:foodix/features/verification/presentation/viewmodel/cubits/verification/verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  final VerificationRepository _verificationRepository;
  Timer? timer;

  VerificationCubit(this._verificationRepository)
      : super(VerificationState());

  Future<void> sendEmailVerification() async {
    _startTimer();
    _verificationRepository.sendEmailVerification();
    emit(
      state.copyWith(
        status: const PageState.success(),
        isEmailVerificationSend: true,
      ),
    );
  }

  Future<void> isEmailVerified() async {
    final res = await _verificationRepository.isEmailVerified();

    res.when(
      failure: (failure) =>
          emit(state.copyWith(status: PageState.failure(failure.message!))),
      success: (success) =>
          emit(state.copyWith(status: PageState.success(success))),
    );
  }

  void _startTimer() {
    if (timer != null) {
      timer!.cancel();
    }

    bool canSend = false;
    int time = 60;
    emit(state.copyWith(time: time, canSend: canSend));

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time > 0) {
        time--;
        emit(state.copyWith(time: time, canSend: canSend));
      } else {
        timer.cancel();
        canSend = true;
        emit(state.copyWith(time: time, canSend: canSend));
      }
    });
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}

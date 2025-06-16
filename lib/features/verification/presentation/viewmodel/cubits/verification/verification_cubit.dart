import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/features/verification/data/repos/verificarion_repo.dart';
import 'package:foodix/features/verification/presentation/viewmodel/cubits/verification/verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  final VerificationRepository _verificationRepository;
  bool _canSend = false;
  int _time = 60;
  Timer? _timer;

  VerificationCubit(this._verificationRepository) : super(VerificationInit());

  Future<void> sendEmailVerification() async {
    _startTimer();
    _verificationRepository.sendEmailVerification();
    emit(VerificationIsEmailVerificationSend());
  }

  Future<void> isEmailVerified() async {
    final res = await _verificationRepository.isEmailVerified();

    res.fold(
      (e) => emit(VerificationFailure(e.errorMsg)),
      (success) => emit(VerificationSuccess(success)),
    );
  }

  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }

    _canSend = false;
    _time = 60;
    emit(VerificationTimerUpdated(_time, _canSend));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_time > 0) {
        _time--;
        emit(VerificationTimerUpdated(_time, _canSend));
      } else {
        _timer?.cancel();
        _canSend = true;
        emit(
          VerificationTimerUpdated(
            _time,
            _canSend,
          ),
        );
      }
    });
  }

  bool get canSend => _canSend;

  int get time => _time;

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

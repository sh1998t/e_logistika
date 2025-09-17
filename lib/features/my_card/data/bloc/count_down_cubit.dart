import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'count_down_state.dart';

class CountdownCubit extends Cubit<CountdownState> {
  Timer? _timer;

  CountdownCubit() : super(CountdownState.initial()) {
    _startCountdown();
  }

  void _startCountdown() {
    _timer?.cancel();
    emit(CountdownState(secondsLeft: 5, isFinished: false));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.secondsLeft > 1) {
        emit(state.copyWith(secondsLeft: state.secondsLeft - 1));
      } else {
        emit(state.copyWith(secondsLeft: 1, isFinished: true));
        _timer?.cancel();
      }
    });
  }

  void restart() {
    _startCountdown();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

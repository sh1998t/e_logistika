class CountdownState {
  final int secondsLeft;
  final bool isFinished;

  CountdownState({required this.secondsLeft, required this.isFinished});

  factory CountdownState.initial() =>
      CountdownState(secondsLeft: 5, isFinished: false);

  CountdownState copyWith({int? secondsLeft, bool? isFinished}) {
    return CountdownState(
      secondsLeft: secondsLeft ?? this.secondsLeft,
      isFinished: isFinished ?? this.isFinished,
    );
  }
}

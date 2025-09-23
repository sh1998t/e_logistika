import 'package:equatable/equatable.dart';

// Holat (state) sinfi
class ParkingLotState extends Equatable {
  final DateTime endTime;
  final int days;
  final int hours;
  final int minutes;
  final Duration duration;

  const ParkingLotState({
    required this.endTime,
    this.days = 0,
    this.hours = 0,
    this.minutes = 0,
    required this.duration,
  });

  @override
  List<Object> get props => [endTime, days, hours, minutes, duration];

  // Holatni yangilash uchun copyWith metodi
  ParkingLotState copyWith({
    DateTime? endTime,
    int? days,
    int? hours,
    int? minutes,
    Duration? duration,
  }) {
    return ParkingLotState(
      endTime: endTime ?? this.endTime,
      days: days ?? this.days,
      hours: hours ?? this.hours,
      minutes: minutes ?? this.minutes,
      duration: duration ?? this.duration,
    );
  }
}

// Cubit sinfi

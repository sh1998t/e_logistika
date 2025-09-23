import 'package:e_logistika/features/creation/presentation/bloc/parking_lot_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParkingLotCubit extends Cubit<ParkingLotState> {
  ParkingLotCubit()
    : super(
        ParkingLotState(endTime: DateTime.now(), duration: const Duration()),
      );

  void updateParkingTime(DateTime selectedTime) {
    final now = DateTime.now();
    if (selectedTime.isBefore(now)) {
      print("Xato: Tanlangan vaqt hozirgi vaqtdan oldin bo‘lmasligi kerak!");
      return;
    }

    final difference = selectedTime.difference(now);
    final days = difference.inDays;
    final hours = difference.inHours % 24;
    final minutes = difference.inMinutes % 60;
    final endTime = now.add(
      Duration(days: days, hours: hours, minutes: minutes),
    );

    emit(
      state.copyWith(
        endTime: endTime,
        days: days,
        hours: hours,
        minutes: minutes,
        duration: Duration(days: days, hours: hours, minutes: minutes),
      ),
    );

    print(
      "EndTime yangilandi: $endTime, Duration: $days kun, $hours soat, $minutes minut",
    );
  }

  void resetTimer() {
    emit(ParkingLotState(endTime: DateTime.now(), duration: const Duration()));
  }
}

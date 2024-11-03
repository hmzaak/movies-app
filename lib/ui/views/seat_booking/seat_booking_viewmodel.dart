import 'dart:math';

import 'package:book_my_seat/book_my_seat.dart';
import 'package:movies/models/seat_number.dart';
import 'package:stacked/stacked.dart';

class SeatBookingViewModel extends BaseViewModel {
  Set<SeatNumber> selectedSeats = {};

  List<List<SeatState>> seatArrangement = List.generate(
    10,
    (row) => List.generate(26, (col) {
      if (col == 5 || col == 20) {
        return SeatState.empty;
      }
      if (row < 4 && (col == 0 || col == 25)) {
        return SeatState.empty;
      }
      if (row == 0 && (col < 3 || col > 22)) {
        return SeatState.empty;
      }
      List<SeatState> statesOtherThanEmpty = [
        SeatState.disabled,
        SeatState.sold,
        SeatState.unselected,
      ];
      return statesOtherThanEmpty[Random().nextInt(3)];
    }),
  );

  onSeatStateChanged(rowI, colI, seatState) {
    if (seatState == SeatState.selected) {
      selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));
    } else {
      selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
    }
    notifyListeners();
  }
}

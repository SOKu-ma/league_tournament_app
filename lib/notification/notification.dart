import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: subtype_of_sealed_class
class MatchNotifier extends StateNotifier<List<MatchState>> {
  MatchNotifier() : super([]);

  void toggleOn(int num) {
    for (final select in state)
      if (select.number == num) select.isSelection = true;
  }

  void toggleOff(int num) {
    for (final select in state)
      if (select.number == num) select.isSelection = false;
  }
}

class MatchState {
  int number;
  bool isSelection;
  MatchState(this.number, this.isSelection);
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class RoundedHeaderState {
  final double highestHeight = 320;
  final double smallestHeight = kToolbarHeight + 24;
  final double currentHeight;
  final double contentOpacity = 1;

  const RoundedHeaderState({this.currentHeight = 256});

  double get scrollFraction => min(
      max((currentHeight - smallestHeight) / (highestHeight - smallestHeight),
          0),
      1);
  double get scrollFraction2 =>
      1 -
      min(
          max(
              (currentHeight - smallestHeight) /
                  (highestHeight - smallestHeight),
              0),
          1);

  double get radius => 50 * scrollFraction;
}

class RoundedHeaderNotifier extends StateNotifier<RoundedHeaderState> {
  RoundedHeaderNotifier() : super(const RoundedHeaderState());

  updateHeight(double currentHeight) {
    final newState = RoundedHeaderState(currentHeight: currentHeight);

    // Check that the new state is not equal to the next (prevents rebuild loop)
    if (state.currentHeight != newState.currentHeight) {
      // Setting state triggers an rebuild, the PostFrameCallback let Flutter
      // postpone the upcoming rebuild at a later time.
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        state = newState;
      });
    }
  }
}

final roundedHeaderProvider =
    StateNotifierProvider<RoundedHeaderNotifier, RoundedHeaderState>((ref) {
  return RoundedHeaderNotifier();
});

// P

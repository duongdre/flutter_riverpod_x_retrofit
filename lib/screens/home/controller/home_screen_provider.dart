import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:async';

part 'home_screen_provider.g.dart';

// Generated notifier providers

@riverpod
class HomeScreenNotifier extends _$HomeScreenNotifier {

  @override
  Stream<int> build() {
    return Stream.periodic(const Duration(minutes: 2000), (count) {
      // Toggle the boolean value every second
      return count % 3;
    });
  }

  // There is no need to have this method since the value auto change every second
  /*void changeLoginCardState() {
    state = !state;
  }*/
}

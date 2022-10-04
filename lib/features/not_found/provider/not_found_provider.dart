import 'package:riverpod/riverpod.dart';

final notFoundProvider = StateNotifierProvider((ref) {
  return NotFound();
});

class NotFound extends StateNotifier<int> {
  NotFound() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

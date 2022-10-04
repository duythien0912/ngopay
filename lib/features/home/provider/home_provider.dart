import 'package:riverpod/riverpod.dart';

final homeProvider = StateNotifierProvider((ref) {
  return Home();
});

class Home extends StateNotifier<int> {
  Home() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

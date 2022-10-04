import 'package:riverpod/riverpod.dart';

final mainScreenProvider = StateNotifierProvider((ref) {
  return MainScreen();
});

class MainScreen extends StateNotifier<int> {
  MainScreen() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

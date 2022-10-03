import 'package:riverpod/riverpod.dart';

final homeProvider = StateNotifierProvider.autoDispose((ref) {
  return Home();
});

class Home extends StateNotifier<int> {
  Home() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

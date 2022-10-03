import 'package:riverpod/riverpod.dart';

final signInProvider = StateNotifierProvider.autoDispose((ref) {
  return SignIn();
});

class SignIn extends StateNotifier<int> {
  SignIn() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

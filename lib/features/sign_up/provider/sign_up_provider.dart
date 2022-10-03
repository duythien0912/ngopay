import 'package:riverpod/riverpod.dart';

final signUpProvider = StateNotifierProvider.autoDispose((ref) {
  return SignUp();
});

class SignUp extends StateNotifier<int> {
  SignUp() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

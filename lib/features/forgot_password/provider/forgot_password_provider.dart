import 'package:riverpod/riverpod.dart';

final forgotPasswordProvider = StateNotifierProvider((ref) {
  return ForgotPassword();
});

class ForgotPassword extends StateNotifier<int> {
  ForgotPassword() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

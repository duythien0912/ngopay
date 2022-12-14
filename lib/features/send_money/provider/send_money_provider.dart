import 'package:riverpod/riverpod.dart';

final sendMoneyProvider = StateNotifierProvider((ref) {
  return SendMoney();
});

class SendMoney extends StateNotifier<int> {
  SendMoney() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

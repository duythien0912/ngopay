import 'package:riverpod/riverpod.dart';

final transactionProvider = StateNotifierProvider((ref) {
  return Transaction();
});

class Transaction extends StateNotifier<int> {
  Transaction() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

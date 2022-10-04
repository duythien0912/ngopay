import 'package:riverpod/riverpod.dart';

final walletProvider = StateNotifierProvider((ref) {
  return Wallet();
});

class Wallet extends StateNotifier<int> {
  Wallet() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

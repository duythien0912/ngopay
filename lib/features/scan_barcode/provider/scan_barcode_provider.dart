import 'package:riverpod/riverpod.dart';

final scanBarcodeProvider = StateNotifierProvider((ref) {
  return ScanBarcode();
});

class ScanBarcode extends StateNotifier<int> {
  ScanBarcode() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

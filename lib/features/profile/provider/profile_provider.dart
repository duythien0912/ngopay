import 'package:riverpod/riverpod.dart';

final profileProvider = StateNotifierProvider((ref) {
  return Profile();
});

class Profile extends StateNotifier<int> {
  Profile() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

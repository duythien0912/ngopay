import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final skipOnboardingController = ChangeNotifierProvider((ref) {
  return SkipOnboardingController();
});

class SkipOnboardingController extends ChangeNotifier {
  static const _skipOnboardingKey = '_skipOnboardingKey';

  Future<void> skip() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_skipOnboardingKey, true);
  }

  Future<bool> read() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_skipOnboardingKey) ?? false;
  }

  /// Only for dev
  Future<bool> reset() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(_skipOnboardingKey);
  }
}

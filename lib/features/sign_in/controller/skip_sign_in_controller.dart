import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final skipSignInController = ChangeNotifierProvider((ref) {
  return SkipSignInController();
});

class SkipSignInController extends ChangeNotifier {
  static const _skipSignInKey = '_skipSignInKey';

  Future<void> skip() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_skipSignInKey, true);
  }

  Future<bool> read() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_skipSignInKey) ?? false;
  }

  /// Only for dev
  Future<bool> reset() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(_skipSignInKey);
  }
}

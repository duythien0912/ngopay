import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final onboardingController = ChangeNotifierProvider.autoDispose((ref) {
  return OnboardingController();
});

class OnboardingController extends ChangeNotifier {
  int step = 0;

  void setStep(int _step) {
    step = _step;
    notifyListeners();
  }
}

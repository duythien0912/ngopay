import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/features/onboarding/controller/controller.dart';
import 'package:ngopay/features/sign_in/sign_in.dart';

final splashScreenController = ChangeNotifierProvider.autoDispose((ref) {
  return SplashScreenController(ref);
});

class SplashScreenController extends ChangeNotifier {
  SplashScreenController(
    this.ref,
  );

  final AutoDisposeChangeNotifierProviderRef<SplashScreenController> ref;

  /// init
  Future init(BuildContext context) async {
    // load is skip onboarding from local db
    final navigator = Beamer.of(context);
    await Future<dynamic>.delayed(const Duration(milliseconds: 800));
    final skipOnboarding = await ref.read(skipOnboardingController).read();
    final skipSignIn = await ref.read(skipSignInController).read();

    if (skipOnboarding == true && skipSignIn == true) {
      navigator.beamToReplacementNamed('/main');
      return;
    }

    if (skipOnboarding == true && skipSignIn == false) {
      navigator.beamToReplacementNamed('/sign_in');
      return;
    }

    if (skipOnboarding == false) {
      navigator.beamToReplacementNamed('/onboarding');
      return;
    }

    navigator.beamToReplacementNamed('/');
    return;
  }
}

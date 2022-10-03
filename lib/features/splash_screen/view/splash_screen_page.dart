import 'package:flutter/material.dart';
import 'package:ngopay/features/splash_screen/splash_screen.dart';

/// {@template splash_screen_page}
/// A description for SplashScreenPage
/// {@endtemplate}
class SplashScreenPage extends StatelessWidget {
  /// {@macro splash_screen_page}
  const SplashScreenPage({super.key});

  /// The static route for SplashScreenPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SplashScreenPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreenView(),
    );
  }
}

/// {@template onboarding_view}
/// Displays the Body of OnboardingView
/// {@endtemplate}
class SplashScreenView extends StatelessWidget {
  /// {@macro SplashScreen_view}
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashScreenBody();
  }
}

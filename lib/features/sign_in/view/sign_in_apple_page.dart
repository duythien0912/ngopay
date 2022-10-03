import 'package:flutter/material.dart';
import 'package:ngopay/features/sign_in/sign_in.dart';

/// {@template sign_in_apple_page}
/// A description for SignInApplePage
/// {@endtemplate}
class SignInApplePage extends StatelessWidget {
  /// {@macro sign_in_apple_page}
  const SignInApplePage({super.key});

  /// The static route for SignInApplePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SignInApplePage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInAppleView(),
    );
  }
}

/// {@template sign_in_view}
/// Displays the Body of SignInAppleView
/// {@endtemplate}
class SignInAppleView extends StatelessWidget {
  /// {@macro sign_in_view}
  const SignInAppleView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignInAppleBody();
  }
}

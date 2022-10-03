import 'package:flutter/material.dart';
import 'package:ngopay/features/sign_in/sign_in.dart';

/// {@template sign_in_google_page}
/// A description for SignInGooglePage
/// {@endtemplate}
class SignInGooglePage extends StatelessWidget {
  /// {@macro sign_in_google_page}
  const SignInGooglePage({super.key});

  /// The static route for SignInGooglePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SignInGooglePage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInGoogleView(),
    );
  }
}

/// {@template sign_in_view}
/// Displays the Body of SignInGoogleView
/// {@endtemplate}
class SignInGoogleView extends StatelessWidget {
  /// {@macro sign_in_view}
  const SignInGoogleView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignInGoogleBody();
  }
}

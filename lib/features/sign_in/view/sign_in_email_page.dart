import 'package:flutter/material.dart';
import 'package:ngopay/features/sign_in/sign_in.dart';

/// {@template sign_in_email_page}
/// A description for SignInEmailPage
/// {@endtemplate}
class SignInEmailPage extends StatelessWidget {
  /// {@macro sign_in_email_page}
  const SignInEmailPage({super.key});

  /// The static route for SignInEmailPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SignInEmailPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInEmailView(),
    );
  }
}

/// {@template sign_in_view}
/// Displays the Body of SignInEmailView
/// {@endtemplate}
class SignInEmailView extends StatelessWidget {
  /// {@macro sign_in_view}
  const SignInEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignInEmailBody();
  }
}

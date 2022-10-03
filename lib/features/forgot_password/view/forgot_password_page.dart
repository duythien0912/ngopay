import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/features/forgot_password/widgets/forgot_password_body.dart';

/// {@template forgot_password_page}
/// A description for ForgotPasswordPage
/// {@endtemplate}
class ForgotPasswordPage extends StatelessWidget {
  /// {@macro forgot_password_page}
  const ForgotPasswordPage({super.key});

  /// The static route for ForgotPasswordPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
        builder: (_) => const ForgotPasswordPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ForgotPasswordView(),
    );
  }
}

/// {@template forgot_password_view}
/// Displays the Body of ForgotPasswordView
/// {@endtemplate}
class ForgotPasswordView extends StatelessWidget {
  /// {@macro forgot_password_view}
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ForgotPasswordBody();
  }
}

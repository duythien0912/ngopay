import 'package:flutter/material.dart';
import 'package:ngopay/features/forgot_password/forgot_password.dart';

/// {@template create_new_password_page}
/// A description for CreateNewPasswordPage
/// {@endtemplate}
class CreateNewPasswordPage extends StatelessWidget {
  /// {@macro create_new_password_page}
  const CreateNewPasswordPage({super.key});

  /// The static route for CreateNewPasswordPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const CreateNewPasswordPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CreateNewPasswordView(),
    );
  }
}

/// {@template forgot_password_view}
/// Displays the Body of CreateNewPasswordView
/// {@endtemplate}
class CreateNewPasswordView extends StatelessWidget {
  /// {@macro forgot_password_view}
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreateNewPasswordBody();
  }
}

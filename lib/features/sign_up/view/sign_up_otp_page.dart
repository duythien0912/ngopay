import 'package:flutter/material.dart';
import 'package:ngopay/features/sign_up/sign_up.dart';

/// {@template sign_up_otp_page}
/// A description for SignUpOtpPage
/// {@endtemplate}
class SignUpOtpPage extends StatelessWidget {
  /// {@macro sign_up_otp_page}
  const SignUpOtpPage({super.key});

  /// The static route for SignUpOtpPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SignUpOtpPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpOtpView(),
    );
  }
}

/// {@template sign_up_otp_view}
/// Displays the Body of SignUpOtpView
/// {@endtemplate}
class SignUpOtpView extends StatelessWidget {
  /// {@macro sign_up_otp_view}
  const SignUpOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignUpOtpBody();
  }
}

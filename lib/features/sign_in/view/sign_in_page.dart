import 'package:flutter/material.dart';
import 'package:ngopay/features/sign_in/widgets/sign_in_body.dart';

/// {@template sign_in_page}
/// A description for SignInPage
/// {@endtemplate}
class SignInPage extends StatelessWidget {
  /// {@macro sign_in_page}
  const SignInPage({super.key});

  /// The static route for SignInPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SignInPage());
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInView(),
    );
  }  
}

/// {@template sign_in_view}
/// Displays the Body of SignInView
/// {@endtemplate}
class SignInView extends StatelessWidget {
  /// {@macro sign_in_view}
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignInBody();
  }
}

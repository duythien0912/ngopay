import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/features/sign_in/controller/controller.dart';

/// {@template sign_in_email_body}
/// Body of the SignInEmailPage.
///
/// Add what it does
/// {@endtemplate}
class SignInEmailBody extends ConsumerWidget {
  /// {@macro sign_in_body}
  const SignInEmailBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(signInProvider);
    return Column(
      children: [
        AppBar(
          title: const Text('Sign In Email'),
          leading: BackButton(
            onPressed: () {
              Beamer.of(context).beamBack();
            },
          ),
        ),
        Text(count.toString()),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              Beamer.of(context).beamToNamed('/forgot_password');
            },
            child: Text('Forgot Password'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              ref.read(skipSignInController).skip();
              Beamer.of(context).beamToReplacementNamed('/home');
            },
            child: Text('Sign In'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              Beamer.of(context).beamToNamed('/sign_up');
            },
            child: Text('Signup'),
          ),
        ),
      ],
    );
  }
}

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/features/sign_in/controller/controller.dart';

/// {@template sign_in_body}
/// Body of the SignInPage.
///
/// Add what it does
/// {@endtemplate}
class SignInBody extends ConsumerWidget {
  /// {@macro sign_in_body}
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(signInProvider);
    return Column(
      children: [
        Text('SignInBody'),
        Text(count.toString()),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Beamer.of(context).beamToNamed('/sign_in_email');
            },
            child: Text('Continue with Email'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Beamer.of(context).beamToNamed('/sign_in_google');
            },
            child: Text('Continue with Google'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Beamer.of(context).beamToNamed('/sign_in_apple');
            },
            child: Text('Continue with Apple'),
          ),
        ),
      ],
    );
  }
}

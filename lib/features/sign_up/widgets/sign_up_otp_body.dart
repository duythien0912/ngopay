import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/features/sign_in/sign_in.dart';
import 'package:ngopay/features/sign_up/sign_up.dart';

/// {@template sign_up_otp_body}
/// Body of the SignUpOtpPage.
///
/// Add what it does
/// {@endtemplate}
class SignUpOtpBody extends ConsumerWidget {
  /// {@macro sign_up_otp_body}
  const SignUpOtpBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(signUpProvider);
    return Column(
      children: [
        AppBar(
          title: const Text('Signup'),
          leading: BackButton(
            onPressed: () {
              Beamer.of(context).beamBack();
            },
          ),
        ),
        Text(count.toString()),
        Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () {
              ref.read(skipSignInController).skip();
              Beamer.of(context).beamToReplacementNamed('/home');
            },
            child: const Text('Continue (Signup Success)'),
          ),
        ),
      ],
    );
  }
}

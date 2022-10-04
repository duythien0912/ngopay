import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/features/sign_up/provider/provider.dart';

/// {@template sign_up_body}
/// Body of the SignUpPage.
///
/// Add what it does
/// {@endtemplate}
class SignUpBody extends ConsumerWidget {
  /// {@macro sign_up_body}
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(signUpProvider);
    return Column(
      children: [
        AppBar(
          title: const Text('Signup'),
          leading: BackButton(
            onPressed: () {
              context.beamBack();
            },
          ),
        ),
        Text(count.toString()),
        Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () {
              context.beamToNamed('/sign_up_otp');
            },
            child: const Text('Continue OTP'),
          ),
        ),
      ],
    );
  }
}

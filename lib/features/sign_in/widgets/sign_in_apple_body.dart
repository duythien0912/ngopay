import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/features/sign_in/controller/controller.dart';

/// {@template sign_in_apple_body}
/// Body of the SignInApplePage.
///
/// Add what it does
/// {@endtemplate}
class SignInAppleBody extends ConsumerWidget {
  /// {@macro sign_in_body}
  const SignInAppleBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(signInProvider);
    return Column(
      children: [
        AppBar(
          title: const Text('Sign In Apple'),
          leading: BackButton(
            onPressed: () {
              Beamer.of(context).beamBack();
            },
          ),
        ),
        Text('/// TODO(thien)'),
      ],
    );
  }
}

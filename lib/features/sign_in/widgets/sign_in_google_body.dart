import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/features/sign_in/controller/controller.dart';

/// {@template sign_in_google_body}
/// Body of the SignInGooglePage.
///
/// Add what it does
/// {@endtemplate}
class SignInGoogleBody extends ConsumerWidget {
  /// {@macro sign_in_body}
  const SignInGoogleBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(signInProvider);
    return Column(
      children: [
        AppBar(
          title: const Text('Sign In Google'),
          leading: BackButton(
            onPressed: () {
              context.beamBack();
            },
          ),
        ),
        Text('/// TODO(thien)'),
      ],
    );
  }
}

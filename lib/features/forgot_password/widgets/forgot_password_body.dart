import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/features/forgot_password/provider/provider.dart';

/// {@template forgot_password_body}
/// Body of the ForgotPasswordPage.
///
/// Add what it does
/// {@endtemplate}
class ForgotPasswordBody extends ConsumerWidget {
  /// {@macro forgot_password_body}
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(forgotPasswordProvider);
    return Column(
      children: [
        AppBar(
          title: const Text('Forgot Password'),
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
              context.beamToNamed('/create_new_password');
            },
            child: const Text('Continue (create new pass)'),
          ),
        ),
      ],
    );
  }
}

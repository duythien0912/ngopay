import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/features/forgot_password/provider/provider.dart';

/// {@template create_new_password_body}
/// Body of the CreateNewPasswordPage.
///
/// Add what it does
/// {@endtemplate}
class CreateNewPasswordBody extends ConsumerWidget {
  /// {@macro create_new_password_body}
  const CreateNewPasswordBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final count = ref.watch(CreateNewPasswordProvider);
    return Column(
      children: [
        AppBar(
          title: const Text('Create new Password'),
          leading: BackButton(
            onPressed: () {
              Beamer.of(context).beamBack();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () {
              Beamer.of(context).beamToReplacementNamed('/sign_in');
              Beamer.of(context).beamToNamed('/sign_in_email');
            },
            child: const Text('Continue'),
          ),
        ),
        // Text(count.toString()),
      ],
    );
  }
}

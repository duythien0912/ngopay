import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:ngopay/features/onboarding/controller/skip_onboarding_controller.dart';
import 'package:ngopay/features/profile/provider/provider.dart';
import 'package:ngopay/features/sign_in/controller/skip_sign_in_controller.dart';

/// {@template profile_body}
/// Body of the ProfilePage.
///
/// Add what it does
/// {@endtemplate}
class ProfileBody extends ConsumerWidget {
  /// {@macro profile_body}
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(profileProvider);
    return Column(
      children: [
        const Text('profile body'),
        Text(count.toString()),
        TextButton(
          onPressed: () {
            ref.read(skipOnboardingController).reset();
            ref.read(skipSignInController).reset();
            Phoenix.rebirth(context);
          },
          child: const Text(
            'Reset Local Data',
          ),
        )
      ],
    );
  }
}

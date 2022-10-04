import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/features/not_found/provider/provider.dart';

/// {@template not_found_body}
/// Body of the NotFoundPage.
///
/// Add what it does
/// {@endtemplate}
class NotFoundBody extends ConsumerWidget {
  /// {@macro not_found_body}
  const NotFoundBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(notFoundProvider);
    return Column(
      children: [
        AppBar(
          title: const Text('404 screen'),
          leading: SizedBox(),
        ),
        Text(count.toString()),
        Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () {
              context.beamToNamed('/splash_screen');
            },
            child: const Text('Return home'),
          ),
        ),
      ],
    );
  }
}

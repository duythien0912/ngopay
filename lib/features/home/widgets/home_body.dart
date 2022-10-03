import 'package:flutter/material.dart';
import 'package:ngopay/features/home/provider/provider.dart';

/// {@template home_body}
/// Body of the HomePage.
///
/// Add what it does
/// {@endtemplate}
class HomeBody extends ConsumerWidget {
  /// {@macro home_body}
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(homeProvider);
    return Column(
      children: [
        Text("Home"),
        Text(count.toString()),
      ],
    );
  }
}

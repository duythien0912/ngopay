import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/app_start.dart';
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
        TextButton(
          onPressed: () {
            context.beamToNamed('/home/scan_barcode');
          },
          child: Text('Scan'),
        ),
        TextButton(
          onPressed: () {
            context.beamToNamed('/candle_chart');
          },
          child: Text('Candle chart'),
        ),
        TextButton(
          onPressed: () {
            context.beamToNamed('/candle_sticks');
          },
          child: Text('Candle Sticks'),
        ),
        TextButton(
          onPressed: () {
            context.beamToNamed('/trading_view');
          },
          child: Text('Trading view'),
        ),
        TextButton(
          onPressed: () {
            startApp(context);
          },
          child: Text('Start mini app'),
        ),
      ],
    );
  }
}

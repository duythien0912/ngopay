import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/features/scan_barcode/provider/provider.dart';

/// {@template scan_barcode_body}
/// Body of the ScanBarcodePage.
///
/// Add what it does
/// {@endtemplate}
class ScanBarcodeBody extends ConsumerWidget {
  /// {@macro scan_barcode_body}
  const ScanBarcodeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(scanBarcodeProvider);
    return Column(
      children: [
        AppBar(
          title: const Text('Scan barcode'),
          leading: BackButton(
            onPressed: () {
              Beamer.of(context).beamBack();
              Beamer.of(context).update(
                configuration: RouteInformation(
                  location: '/home?tab=send_money',
                ),
                rebuild: false,
              );
            },
          ),
        ),
        Text(count.toString()),
      ],
    );
  }
}

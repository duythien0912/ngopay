import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/features/transaction/provider/provider.dart';

/// {@template transaction_body}
/// Body of the TransactionPage.
///
/// Add what it does
/// {@endtemplate}
class TransactionBody extends ConsumerWidget {
  /// {@macro transaction_body}
  const TransactionBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(transactionProvider);
    return Column(
      children: [
        Text("Transaction"),
        Text(count.toString()),
        TextButton(
          onPressed: () {
            context.beamToNamed('/scan_barcode');
          },
          child: Text('Scan'),
        ),
      ],
    );
  }
}

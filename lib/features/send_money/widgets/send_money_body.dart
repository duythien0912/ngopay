import 'package:flutter/material.dart';
import 'package:ngopay/features/send_money/provider/provider.dart';

/// {@template send_money_body}
/// Body of the SendMoneyPage.
///
/// Add what it does
/// {@endtemplate}
class SendMoneyBody extends ConsumerWidget {
  /// {@macro send_money_body}
  const SendMoneyBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(sendMoneyProvider);
    return Column(
      children: [
        Text('send_money page'),
        Text(count.toString()),
      ],
    );
  }
}

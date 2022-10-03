import 'package:flutter/material.dart';
import 'package:ngopay/features/wallet/provider/provider.dart';

/// {@template wallet_body}
/// Body of the WalletPage.
///
/// Add what it does
/// {@endtemplate}
class WalletBody extends ConsumerWidget {
  /// {@macro wallet_body}
  const WalletBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(walletProvider);
    return Column(
      children: [
        Text("Wallet body"),
        Text(count.toString()),
      ],
    );
  }
}

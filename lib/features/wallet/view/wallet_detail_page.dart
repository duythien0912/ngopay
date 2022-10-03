import 'package:flutter/material.dart';
import 'package:ngopay/features/wallet/widgets/wallet_body.dart';

/// {@template wallet_page}
/// A description for WalletDetailPage
/// {@endtemplate}
class WalletDetailPage extends StatelessWidget {
  /// {@macro wallet_page}
  const WalletDetailPage({
    super.key,
    required this.walletId,
  });

  final String walletId;

  /// The static route for WalletDetailPage
  static Route<dynamic> route(String walletId) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => WalletDetailPage(
        walletId: walletId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WalletDetailView(),
    );
  }
}

/// {@template wallet_view}
/// Displays the Body of WalletDetailView
/// {@endtemplate}
class WalletDetailView extends StatelessWidget {
  /// {@macro wallet_view}
  const WalletDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const WalletBody();
  }
}

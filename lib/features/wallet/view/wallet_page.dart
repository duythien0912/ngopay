import 'package:flutter/material.dart';
import 'package:ngopay/features/wallet/widgets/wallet_body.dart';

/// {@template wallet_page}
/// A description for WalletPage
/// {@endtemplate}
class WalletPage extends StatelessWidget {
  /// {@macro wallet_page}
  const WalletPage({super.key});

  /// The static route for WalletPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const WalletPage());
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WalletView(),
    );
  }  
}

/// {@template wallet_view}
/// Displays the Body of WalletView
/// {@endtemplate}
class WalletView extends StatelessWidget {
  /// {@macro wallet_view}
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return const WalletBody();
  }
}

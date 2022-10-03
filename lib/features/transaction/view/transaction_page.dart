import 'package:flutter/material.dart';
import 'package:ngopay/features/transaction/widgets/transaction_body.dart';

/// {@template transaction_page}
/// A description for TransactionPage
/// {@endtemplate}
class TransactionPage extends StatelessWidget {
  /// {@macro transaction_page}
  const TransactionPage({super.key});

  /// The static route for TransactionPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const TransactionPage());
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TransactionView(),
    );
  }  
}

/// {@template transaction_view}
/// Displays the Body of TransactionView
/// {@endtemplate}
class TransactionView extends StatelessWidget {
  /// {@macro transaction_view}
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const TransactionBody();
  }
}

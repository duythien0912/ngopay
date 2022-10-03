import 'package:flutter/material.dart';
import 'package:ngopay/features/send_money/widgets/send_money_body.dart';

/// {@template send_money_page}
/// A description for SendMoneyPage
/// {@endtemplate}
class SendMoneyPage extends StatelessWidget {
  /// {@macro send_money_page}
  const SendMoneyPage({super.key});

  /// The static route for SendMoneyPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SendMoneyPage());
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SendMoneyView(),
    );
  }  
}

/// {@template send_money_view}
/// Displays the Body of SendMoneyView
/// {@endtemplate}
class SendMoneyView extends StatelessWidget {
  /// {@macro send_money_view}
  const SendMoneyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SendMoneyBody();
  }
}

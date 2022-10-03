import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/features/transaction/view/transaction_page.dart';

class TransactionLocation extends BeamLocation<BeamState> {
  TransactionLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('transaction'),
          title: 'Tab Transaction',
          type: BeamPageType.noTransition,
          child: TransactionPage(),
        ),
        if (state.uri.pathSegments.length == 2)
          const BeamPage(
            key: ValueKey('transaction/details'),
            title: 'Details B',
            // child: TransactionDetailPage(),
            child: TransactionPage(),
          ),
      ];
}

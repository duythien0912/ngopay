import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/features/send_money/view/send_money_page.dart';

class SendMoneyLocation extends BeamLocation<BeamState> {
  SendMoneyLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('send_money'),
          title: 'Tab SendMoney',
          type: BeamPageType.noTransition,
          child: SendMoneyPage(),
        ),
        if (state.uri.pathSegments.length == 2)
          const BeamPage(
            key: ValueKey('send_money/details'),
            title: 'Details B',
            // child: SendMoneyDetailPage(),
            child: SendMoneyPage(),
          ),
      ];
}

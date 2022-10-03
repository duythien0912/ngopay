import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/features/wallet/view/wallet_page.dart';

class WalletLocation extends BeamLocation<BeamState> {
  WalletLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('wallet'),
          title: 'Tab Wallet',
          type: BeamPageType.noTransition,
          child: WalletPage(),
        ),
        if (state.uri.pathSegments.length == 2)
          const BeamPage(
            key: ValueKey('wallet/details'),
            title: 'Details B',
            // child: WalletDetailPage(),
            child: WalletPage(),
          ),
      ];
}

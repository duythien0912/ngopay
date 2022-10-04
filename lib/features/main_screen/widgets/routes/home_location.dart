import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/features/home/home.dart';

class HomeLocation extends BeamLocation<BeamState> {
  HomeLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('home'),
          title: 'Tab Home',
          type: BeamPageType.noTransition,
          child: HomePage(),
        ),
        if (state.pathParameters.containsKey('details'))
          const BeamPage(
            key: ValueKey('home/details'),
            title: 'Details Home',
            child: HomePage(),
          ),
      ];
}

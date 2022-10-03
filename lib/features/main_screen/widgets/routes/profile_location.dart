import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/features/profile/view/profile_page.dart';

class ProfileLocation extends BeamLocation<BeamState> {
  ProfileLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('profile'),
          title: 'Tab Profile',
          type: BeamPageType.noTransition,
          child: ProfilePage(),
        ),
        if (state.uri.pathSegments.length == 2)
          const BeamPage(
            key: ValueKey('profile/details'),
            title: 'Details ProfilePage',
            // child: ProfileDetailPage(),
            child: ProfilePage(),
          ),
      ];
}

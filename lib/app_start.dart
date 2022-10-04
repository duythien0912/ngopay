import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'package:ngopay/features/pub/pub.dart';

/// Mini app with beamer
/// step 1: add miniAppRouters to global app routers
/// step 2: push to app named
/// ! Do not defined router have same name with root routers

final miniAppRouters = {
  // ================Pub App Flow================
  // context.beamToNamed('/pub_app');
  '/pub_app': (BuildContext context, BeamState state, Object? data) {
    return const PubSearchPage();
  },
  // context.beamToNamed('/pub_app/:package_name');
  '/pub_app/:package_name':
      (BuildContext context, BeamState state, Object? data) {
    final packageName = state.pathParameters['package_name'] ?? '';
    return PackageDetailPage(
      packageName: packageName,
    );
  },
  // ================***================
};

void startApp(BuildContext context) {
  context.beamToNamed('/pub_app');
}

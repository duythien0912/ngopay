import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:ngopay/app_ui.dart';
import 'package:ngopay/features/onboarding/controller/controller.dart';
import 'package:ngopay/features/sign_in/controller/controller.dart';
import 'package:ngopay/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    Phoenix(
      child: Builder(
        builder: (context) {
          final container = ProviderContainer();
          final routerDelegate = createDelegate(container.read);
          final routeInformationParser = BeamerParser();
          return UncontrolledProviderScope(
            container: container,
            child: BeamerProvider(
              routerDelegate: routerDelegate,
              child: MyApp(
                routeInformationParser,
                routerDelegate,
              ),
            ),
          );
        },
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp(this.routeInformationParser, this.routerDelegate, {Key? key})
      : super(key: key);

  final RouteInformationParser<Object> routeInformationParser;
  final BeamerDelegate routerDelegate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //* Authentication listener
    // ref.listen(authenticationListenerProvider, (bool isLoggedIn) {
    //   if (isLoggedIn) {
    //     context.beamTo(HomeLocation());
    //   } else {
    //     context.beamTo(AuthenticationLocation());
    //   }
    // });

    ref
      ..watch(skipSignInController)
      ..watch(skipOnboardingController);

    return MaterialApp.router(
      title: 'Ngo Pay',
      routeInformationParser: routeInformationParser,
      routerDelegate: routerDelegate,
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: routerDelegate,
      ),
      theme: NgopayTheme.standard,
    );
  }
}

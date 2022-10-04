import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/app_ui.dart';
import 'package:ngopay/features/onboarding/controller/controller.dart';
import 'package:ngopay/features/sign_in/controller/controller.dart';
import 'package:ngopay/router.dart';
import 'package:ngopay/src/widgets/phoenix.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  final routerDelegate = createDelegate(container.read);
  final routeInformationParser = BeamerParser();

  runApp(
    Builder(
      key: const ValueKey('main_MyApp'),
      builder: (context) {
        return UncontrolledProviderScope(
          container: container,
          child: BeamerProvider(
            routerDelegate: routerDelegate,
            child: Phoenix(
              child: MyApp(
                routeInformationParser: routeInformationParser,
                routerDelegate: routerDelegate,
              ),
            ),
          ),
        );
      },
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({
    Key? key,
    required this.routeInformationParser,
    required this.routerDelegate,
  }) : super(key: key);

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

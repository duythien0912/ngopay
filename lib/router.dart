import 'dart:developer';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/features/forgot_password/forgot_password.dart';
import 'package:ngopay/features/main_screen/view/main_screen_page.dart';
import 'package:ngopay/features/not_found/view/not_found_page.dart';
import 'package:ngopay/features/onboarding/view/onboarding_page.dart';
import 'package:ngopay/features/pub/pub.dart';
import 'package:ngopay/features/scan_barcode/scan_barcode.dart';
import 'package:ngopay/features/sign_in/sign_in.dart';
import 'package:ngopay/features/sign_in/view/sign_in_apple_page.dart';
import 'package:ngopay/features/sign_in/view/sign_in_google_page.dart';
import 'package:ngopay/features/sign_up/sign_up.dart';
import 'package:ngopay/features/splash_screen/view/splash_screen_page.dart';

// class AuthenticationNotifier extends StateNotifier<bool> {
//   AuthenticationNotifier(this._authenticationRepository) : super(false) {
//     _authenticationRepository.getUser().listen((user) {
//       if (user.uid == null) {
//         state = false;
//       } else {
//         state = true;
//       }
//     });
//   }

//   final AuthenticationRepository _authenticationRepository;
//   late final StreamSubscription<User?> _userSubscription;

//   @override
//   void dispose() {
//     _userSubscription.cancel();
//     super.dispose();
//   }
// }

// final authenticationListenerProvider = StateNotifierProvider<AuthenticationNotifier, bool>(
//   (ref) => AuthenticationNotifier(ref.watch(authenticationRepositoryProvider)),
// );

/// TODO(thien): update template
/// https://gist.github.com/Zambrella/73486d027fa0186d4e8ea7ccb11a5079
BeamerDelegate createDelegate(dynamic read) {
  // read(authenticationListenerProvider)
  return BeamerDelegate(
    initialPath: '/pub_app',
    // initialPath: '/splash_screen',
    // transitionDelegate: const NoAnimationTransitionDelegate(),
    locationBuilder: RoutesLocationBuilder(
      routes: {
        // ================***================
        // ================Splash/Onboarding Flow================
        // context.beamToNamed('/splash_screen');
        '/splash_screen': (context, state, data) => const SplashScreenPage(),
        // context.beamToNamed('/pub_app');
        '/pub_app': (context, state, data) => const PubSearchPage(),
        // context.beamToNamed('/pub_app/:package_name');
        '/pub_app/:package_name': (context, state, data) {
          final packageName = state.pathParameters['package_name'] ?? '';
          return PackageDetailPage(
            packageName: packageName,
          );
        },
        // context.beamToNamed('/onboarding');
        '/onboarding': (context, state, data) => const BeamPage(
              type: BeamPageType.slideTransition,
              child: OnboardingPage(),
            ),
        // ================***================

        // ================***================
        // ================SignIn/Login Flow================
        // context.beamToNamed('/sign_in');
        '/sign_in': (context, state, data) => const SignInPage(),
        // context.beamToNamed('/sign_in_email');
        '/sign_in_email': (context, state, data) => const SignInEmailPage(),
        // context.beamToNamed('/sign_in_apple');
        '/sign_in_apple': (context, state, data) => const SignInApplePage(),
        // context.beamToNamed('/sign_in_email');
        '/sign_in_google': (context, state, data) => const SignInGooglePage(),
        // context.beamToNamed('/sign_up');
        '/sign_up': (context, state, data) => const SignUpPage(),
        // context.beamToNamed('/sign_up_otp');
        '/sign_up_otp': (context, state, data) => const SignUpOtpPage(),
        // context.beamToNamed('/forgot_password');
        '/forgot_password': (context, state, data) =>
            const ForgotPasswordPage(),
        // context.beamToNamed('/create_new_password');
        '/create_new_password': (context, state, data) =>
            const CreateNewPasswordPage(),
        // ================***================

        // ================***================
        // ================Home Flow================
        // context.beamToNamed('/home');
        '/home': (context, state, data) {
          var initialIndex = 0;
          final tab = state.queryParameters['tab'];
          if (tab == '') {
            initialIndex = 0;
          }
          if (tab == 'transaction') {
            initialIndex = 1;
          }
          if (tab == 'send_money') {
            initialIndex = 2;
          }
          if (tab == 'wallet') {
            initialIndex = 3;
          }
          if (tab == 'profile') {
            initialIndex = 4;
          }

          return BeamPage(
            key: const ValueKey('main_screen_page'),
            title: 'Main Screen Page',
            popToNamed: '/splash_screen',
            type: BeamPageType.noTransition,
            child: MainScreenPage(
              initialIndex: initialIndex,
            ),
          );
        },
        // context.beamToNamed('/scan_barcode');
        '/scan_barcode': (context, state, data) {
          return BeamPage(
            key: const ValueKey('scan_barcode_page'),
            title: 'Scan barcode page',
            child: const ScanBarcodePage(),
            onPopPage: (context, delegate, _, page) {
              delegate.update(
                configuration: const RouteInformation(
                  location: '/home?tab=send_money',
                ),
                rebuild: false,
              );
              return true;
            },
          );
        },
        // ================***================

        // nested-routes hiện có bug 1 là router hết ở trong page home 2 là chỉ dùng params để điều hướng
        '*': (context, state, data) {
          log(state.uri.toString());
          return const BeamPage(
            key: ValueKey('not_found_page'),
            title: 'Not found page',
            popToNamed: '/splash_screen',
            type: BeamPageType.slideTransition,
            child: NotFoundPage(),
          );
        },
      },
    ),
  );
}

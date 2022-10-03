import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/features/forgot_password/forgot_password.dart';
import 'package:ngopay/features/home/home.dart';
import 'package:ngopay/features/main_screen/view/main_screen_page.dart';
import 'package:ngopay/features/not_found/view/not_found_page.dart';
import 'package:ngopay/features/onboarding/view/onboarding_page.dart';
import 'package:ngopay/features/sign_in/sign_in.dart';
import 'package:ngopay/features/sign_in/view/sign_in_apple_page.dart';
import 'package:ngopay/features/sign_in/view/sign_in_google_page.dart';
import 'package:ngopay/features/sign_up/sign_up.dart';
import 'package:ngopay/features/splash_screen/view/splash_screen_page.dart';
import 'package:ngopay/features/transaction/view/transaction_page.dart';
import 'package:ngopay/features/wallet/wallet.dart';

import 'package:ngopay/features/profile/profile.dart';
import 'package:ngopay/features/send_money/send_money.dart';

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
    initialPath: '/splash_screen',
    locationBuilder: RoutesLocationBuilder(
      routes: {
        // context.beamToNamed('/splash_screen');
        '/splash_screen': (context, state, data) => const SplashScreenPage(),
        // context.beamToNamed('/onboarding');
        '/onboarding': (context, state, data) => const BeamPage(
              type: BeamPageType.slideTransition,
              child: OnboardingPage(),
            ),
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
        // context.beamToNamed('/main');
        '/main': (context, state, data) => const BeamPage(
              key: ValueKey('main_screen_page'),
              title: 'Main Screen Page',
              popToNamed: '/main',
              type: BeamPageType.noTransition,
              child: MainScreenPage(),
            ),
        // context.beamToNamed('/home');
        '/home': (context, state, data) => const BeamPage(
              key: ValueKey('main_screen_page'),
              title: 'Main Screen Page',
              popToNamed: '/main',
              type: BeamPageType.noTransition,
              child: MainScreenPage(),
            ),
        // context.beamToNamed('/transaction');
        '/transaction': (context, state, data) => const BeamPage(
              key: ValueKey('main_screen_page'),
              title: 'Main Screen Page',
              popToNamed: '/main',
              type: BeamPageType.noTransition,
              child: MainScreenPage(),
            ),
        // context.beamToNamed('/send_money');
        '/send_money': (context, state, data) => const BeamPage(
              key: ValueKey('main_screen_page'),
              title: 'Main Screen Page',
              popToNamed: '/main',
              type: BeamPageType.noTransition,
              child: MainScreenPage(),
            ),
        // context.beamToNamed('/wallet');
        '/wallet': (context, state, data) => const BeamPage(
              key: ValueKey('main_screen_page'),
              title: 'Main Screen Page',
              popToNamed: '/main',
              type: BeamPageType.noTransition,
              child: MainScreenPage(),
            ),
        // context.beamToNamed('/profile');
        '/profile': (context, state, data) => const BeamPage(
              key: ValueKey('main_screen_page'),
              title: 'Main Screen Page',
              popToNamed: '/main',
              type: BeamPageType.noTransition,
              child: MainScreenPage(),
            ),
        // context.beamToNamed('/wallet/2', data: MyObject());
        '/wallet/:walletId': (context, state, data) {
          // final info = (data as MyObject).info;
          final walletId = state.pathParameters['walletId']!;
          return BeamPage(
            key: ValueKey('book-$walletId'),
            title: 'A wallet #$walletId',
            popToNamed: '/',
            type: BeamPageType.slideTransition,
            child: WalletDetailPage(walletId: walletId),
          );
        },
        // nested-routes
        '*': (context, state, data) => const BeamPage(
              key: ValueKey('undefined_page'),
              title: 'Undefined page',
              popToNamed: '/',
              type: BeamPageType.slideTransition,
              child: NotFoundPage(),
            ),
      },
    ),
  );
}

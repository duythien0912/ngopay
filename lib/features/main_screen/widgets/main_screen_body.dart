import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/app_ui.dart';
import 'package:ngopay/features/main_screen/provider/provider.dart';
import 'package:ngopay/features/main_screen/widgets/routes/home_location.dart';
import 'package:ngopay/features/main_screen/widgets/routes/profile_location.dart';
import 'package:ngopay/features/main_screen/widgets/routes/send_money_location.dart';
import 'package:ngopay/features/main_screen/widgets/routes/transaction_location.dart';
import 'package:ngopay/features/main_screen/widgets/routes/wallet_location.dart';
import 'package:ngopay/features/splash_screen/view/splash_screen_page.dart';

class MainScreenBody extends ConsumerStatefulWidget {
  const MainScreenBody({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenBodyState();
}

class _MainScreenBodyState extends ConsumerState<MainScreenBody> {
  // keep track of the currently selected index
  late int _currentIndex;

  // create two nested delegates
  final _routerDelegates = [
    BeamerDelegate(
      initialPath: '/home',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('/home') ||
            routeInformation.location!.contains('/main')) {
          return HomeLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/transaction',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('/transaction')) {
          return TransactionLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/send_money',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('/send_money')) {
          return SendMoneyLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/wallet',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('/wallet')) {
          return WalletLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/profile',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('/profile')) {
          return ProfileLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
  ];

  // update the _currentIndex if necessary
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final uriString = Beamer.of(context).configuration.location!;
    _currentIndex = -1;
    if (uriString.contains('/main') || uriString.contains('/home')) {
      _currentIndex = 0;
    }
    if (uriString.contains('/transaction')) {
      _currentIndex = 1;
    }
    if (uriString.contains('/send_money')) {
      _currentIndex = 2;
    }
    if (uriString.contains('/wallet')) {
      _currentIndex = 3;
    }
    if (uriString.contains('/profile')) {
      _currentIndex = 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    final count = ref.watch(mainScreenProvider);
    return Column(
      children: [
        AppBar(
          title: const Text('Main screen'),
          leading: SizedBox(),
        ),
        Expanded(
          child: IndexedStack(
            index: _currentIndex,
            children: [
              // use Beamer widgets as children
              Beamer(
                routerDelegate: _routerDelegates[0],
              ),
              Beamer(
                routerDelegate: _routerDelegates[1],
              ),
              Beamer(
                routerDelegate: _routerDelegates[2],
              ),
              Beamer(
                routerDelegate: _routerDelegates[3],
              ),
              Beamer(
                routerDelegate: _routerDelegates[4],
              ),
            ],
          ),
        ),
        BottomNavigationBar(
          currentIndex: _currentIndex,
          // backgroundColor: NgopayColors.black,
          type: BottomNavigationBarType.fixed,

          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Transaction',
              icon: Icon(Icons.settings),
            ),
            BottomNavigationBarItem(
              label: 'Send Money',
              icon: Icon(Icons.send),
            ),
            BottomNavigationBarItem(
              label: 'Wallet',
              icon: Icon(Icons.wallet),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person),
            ),
          ],
          onTap: (index) {
            if (index != _currentIndex) {
              setState(() => _currentIndex = index);
              _routerDelegates[_currentIndex].update(rebuild: false);
            }
          },
        ),
      ],
    );
  }
}

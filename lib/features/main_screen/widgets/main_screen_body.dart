import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ngopay/app_ui.dart';
import 'package:ngopay/features/home/view/home_page.dart';
import 'package:ngopay/features/main_screen/provider/provider.dart';
import 'package:ngopay/features/main_screen/widgets/routes/home_location.dart';
import 'package:ngopay/features/main_screen/widgets/routes/profile_location.dart';
import 'package:ngopay/features/main_screen/widgets/routes/send_money_location.dart';
import 'package:ngopay/features/main_screen/widgets/routes/transaction_location.dart';
import 'package:ngopay/features/main_screen/widgets/routes/wallet_location.dart';
import 'package:ngopay/features/profile/view/profile_page.dart';
import 'package:ngopay/features/send_money/view/send_money_page.dart';
import 'package:ngopay/features/splash_screen/view/splash_screen_page.dart';
import 'package:ngopay/features/transaction/view/transaction_page.dart';
import 'package:ngopay/features/wallet/view/wallet_page.dart';

class MainScreenBody extends ConsumerStatefulWidget {
  const MainScreenBody({Key? key, required this.initialIndex})
      : super(key: key);

  final int initialIndex;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenBodyState();
}

class _MainScreenBodyState extends ConsumerState<MainScreenBody> {
  // keep track of the currently selected index
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final count = ref.watch(mainScreenProvider);
    return Column(
      children: [
        AppBar(
          title: const Text('Main screen'),
          leading: const SizedBox(),
        ),
        Expanded(
          child: IndexedStack(
            index: _currentIndex,
            children: const [
              HomePage(),
              TransactionPage(),
              SendMoneyPage(),
              WalletPage(),
              ProfilePage(),
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
              var tab = '';
              if (index == 0) {
                tab = '/home';
              }
              if (index == 1) {
                tab = '/home?tab=transaction';
              }
              if (index == 2) {
                tab = '/home?tab=send_money';
              }
              if (index == 3) {
                tab = '/home?tab=wallet';
              }
              if (index == 4) {
                tab = '/home?tab=profile';
              }
              Beamer.of(context).update(
                configuration: RouteInformation(
                  location: tab,
                ),
                rebuild: false,
              );
              setState(() => _currentIndex = index);
            }
          },
        ),
      ],
    );
  }
}

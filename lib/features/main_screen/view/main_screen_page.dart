import 'package:flutter/material.dart';
import 'package:ngopay/features/main_screen/widgets/main_screen_body.dart';

/// {@template main_screen_page}
/// A description for MainScreenPage
/// {@endtemplate}
class MainScreenPage extends StatelessWidget {
  /// {@macro main_screen_page}
  const MainScreenPage({super.key});

  /// The static route for MainScreenPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const MainScreenPage());
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainScreenView(),
    );
  }  
}

/// {@template main_screen_view}
/// Displays the Body of MainScreenView
/// {@endtemplate}
class MainScreenView extends StatelessWidget {
  /// {@macro main_screen_view}
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainScreenBody();
  }
}

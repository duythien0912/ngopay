import 'package:flutter/material.dart';
import 'package:ngopay/features/main_screen/widgets/main_screen_body.dart';

/// {@template main_screen_page}
/// A description for MainScreenPage
/// {@endtemplate}
class MainScreenPage extends StatelessWidget {
  /// {@macro main_screen_page}
  const MainScreenPage({super.key, required this.initialIndex});

  /// The static route for MainScreenPage
  static Route<dynamic> route(int initialIndex) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => MainScreenPage(
        initialIndex: initialIndex,
      ),
    );
  }

  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainScreenView(
        initialIndex: initialIndex,
      ),
    );
  }
}

/// {@template main_screen_view}
/// Displays the Body of MainScreenView
/// {@endtemplate}
class MainScreenView extends StatelessWidget {
  /// {@macro main_screen_view}
  const MainScreenView({super.key, required this.initialIndex});

  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return MainScreenBody(
      initialIndex: initialIndex,
    );
  }
}

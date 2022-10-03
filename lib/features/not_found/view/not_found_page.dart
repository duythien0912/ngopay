import 'package:flutter/material.dart';
import 'package:ngopay/features/not_found/widgets/not_found_body.dart';

/// {@template not_found_page}
/// A description for NotFoundPage
/// {@endtemplate}
class NotFoundPage extends StatelessWidget {
  /// {@macro not_found_page}
  const NotFoundPage({super.key});

  /// The static route for NotFoundPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const NotFoundPage());
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NotFoundView(),
    );
  }  
}

/// {@template not_found_view}
/// Displays the Body of NotFoundView
/// {@endtemplate}
class NotFoundView extends StatelessWidget {
  /// {@macro not_found_view}
  const NotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return const NotFoundBody();
  }
}

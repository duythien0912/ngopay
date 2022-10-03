// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngopay/features/splash_screen/splash_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SplashScreenBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        MaterialApp(home: SplashScreenBody()),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}

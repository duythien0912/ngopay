// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngopay/features/main_screen/main_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MainScreenBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        MaterialApp(home: MainScreenBody()),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}

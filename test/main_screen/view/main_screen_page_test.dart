// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngopay/features/main_screen/main_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MainScreenPage', () {
    group('route', () {
      test('is routable', () {
        expect(MainScreenPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders MainScreenView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: MainScreenPage()));
      expect(find.byType(MainScreenView), findsOneWidget);
    });
  });
}

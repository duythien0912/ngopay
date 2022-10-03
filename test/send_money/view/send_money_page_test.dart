// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngopay/features/send_money/send_money.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SendMoneyPage', () {
    group('route', () {
      test('is routable', () {
        expect(SendMoneyPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders SendMoneyView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: SendMoneyPage()));
      expect(find.byType(SendMoneyView), findsOneWidget);
    });
  });
}

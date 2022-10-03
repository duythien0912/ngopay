// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngopay/features/send_money/send_money.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SendMoneyBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        MaterialApp(home: SendMoneyBody()),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}

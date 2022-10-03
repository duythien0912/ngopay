// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngopay/features/transaction/transaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TransactionBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        MaterialApp(home: TransactionBody()),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}

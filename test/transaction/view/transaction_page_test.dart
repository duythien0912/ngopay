// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngopay/features/transaction/transaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TransactionPage', () {
    group('route', () {
      test('is routable', () {
        expect(TransactionPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders TransactionView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: TransactionPage()));
      expect(find.byType(TransactionView), findsOneWidget);
    });
  });
}

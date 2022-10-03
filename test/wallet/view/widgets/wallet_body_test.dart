// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngopay/features/wallet/wallet.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WalletBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        MaterialApp(home: WalletBody()),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngopay/features/wallet/wallet.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WalletPage', () {
    group('route', () {
      test('is routable', () {
        expect(WalletPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders WalletView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: WalletPage()));
      expect(find.byType(WalletView), findsOneWidget);
    });
  });
}

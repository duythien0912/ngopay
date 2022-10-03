// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngopay/features/sign_up/sign_up.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SignUpBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        MaterialApp(home: SignUpBody()),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}

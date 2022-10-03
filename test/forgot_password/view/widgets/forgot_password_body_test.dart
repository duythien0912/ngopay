// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngopay/features/forgot_password/forgot_password.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ForgotPasswordBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        MaterialApp(home: ForgotPasswordBody()),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}

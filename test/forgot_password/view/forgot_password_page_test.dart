// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngopay/features/forgot_password/forgot_password.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ForgotPasswordPage', () {
    group('route', () {
      test('is routable', () {
        expect(ForgotPasswordPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders ForgotPasswordView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ForgotPasswordPage()));
      expect(find.byType(ForgotPasswordView), findsOneWidget);
    });
  });
}

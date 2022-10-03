// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngopay/features/sign_in/sign_in.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SignInPage', () {
    group('route', () {
      test('is routable', () {
        expect(SignInPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders SignInView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: SignInPage()));
      expect(find.byType(SignInView), findsOneWidget);
    });
  });
}

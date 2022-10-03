// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngopay/features/sign_in/sign_in.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SignInBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        MaterialApp(home: SignInBody()),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}

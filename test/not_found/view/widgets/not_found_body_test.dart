// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngopay/features/not_found/not_found.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NotFoundBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        MaterialApp(home: NotFoundBody()),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}

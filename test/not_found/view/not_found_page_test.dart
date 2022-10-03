// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngopay/features/not_found/not_found.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NotFoundPage', () {
    group('route', () {
      test('is routable', () {
        expect(NotFoundPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders NotFoundView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: NotFoundPage()));
      expect(find.byType(NotFoundView), findsOneWidget);
    });
  });
}

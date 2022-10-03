// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngopay/features/onboarding/onboarding.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnboardingPage', () {
    group('route', () {
      test('is routable', () {
        expect(OnboardingPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders OnboardingView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: OnboardingPage()));
      expect(find.byType(OnboardingView), findsOneWidget);
    });
  });
}

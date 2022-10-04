// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngopay/features/scan_barcode/scan_barcode.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ScanBarcodePage', () {
    group('route', () {
      test('is routable', () {
        expect(ScanBarcodePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders ScanBarcodeView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ScanBarcodePage()));
      expect(find.byType(ScanBarcodeView), findsOneWidget);
    });
  });
}

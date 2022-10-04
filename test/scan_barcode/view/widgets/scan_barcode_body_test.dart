// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngopay/features/scan_barcode/scan_barcode.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ScanBarcodeBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        MaterialApp(home: ScanBarcodeBody()),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}

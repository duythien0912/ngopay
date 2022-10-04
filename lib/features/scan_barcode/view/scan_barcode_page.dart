import 'package:flutter/material.dart';
import 'package:ngopay/features/scan_barcode/widgets/scan_barcode_body.dart';

/// {@template scan_barcode_page}
/// A description for ScanBarcodePage
/// {@endtemplate}
class ScanBarcodePage extends StatelessWidget {
  /// {@macro scan_barcode_page}
  const ScanBarcodePage({super.key});

  /// The static route for ScanBarcodePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const ScanBarcodePage());
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScanBarcodeView(),
    );
  }  
}

/// {@template scan_barcode_view}
/// Displays the Body of ScanBarcodeView
/// {@endtemplate}
class ScanBarcodeView extends StatelessWidget {
  /// {@macro scan_barcode_view}
  const ScanBarcodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanBarcodeBody();
  }
}

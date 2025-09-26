import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:solar_management_system/inverter/history_inverters/export_file_inverters/pdf_export.dart';

class PdfPreviewScreen extends StatelessWidget {
  const PdfPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Preview')),
      body: PdfPreview(
        build: (context) => exportPdf(),
      ),
    );
  }
}

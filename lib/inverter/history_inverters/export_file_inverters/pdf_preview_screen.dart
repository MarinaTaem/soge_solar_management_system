import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:solar_management_system/inverter/history_inverters/export_file_inverters/pdf_export.dart';

class PdfPreviewScreen extends StatelessWidget {
  String nameInverter;
  String nameStation;
  double pv_v;
  double pv_a;
  double pv;
  double grid;
  double grid_a;
  double output_v;
  double output_a;
  double output;
  double output_hz;
  PdfPreviewScreen(
      {required this.nameInverter,
      required this.nameStation,
      this.pv_v = 0,
      this.pv_a = 0,
      this.pv = 0,
      this.grid_a = 0,
      this.grid = 0,
      this.output_v = 0,
      this.output_a = 0,
      this.output = 0,
      this.output_hz = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Preview')),
      body: PdfPreview(
        build: (context) => exportPdf(
          pv_v: 2111,
        ),
      ),
    );
  }
}

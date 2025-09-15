import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfPreviewScreen extends StatelessWidget {
  const PdfPreviewScreen({super.key});

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document();

    final double col0 = 28;
    final double col1 = 112;
    final double subColW = 44;
    final double pvWidth = subColW * 3;
    final double gridWidth = subColW * 2;
    final double outputWidth = subColW * 4;

    final headerStyle =
        pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold);
    final smallStyle = pw.TextStyle(fontSize: 8);

    // sample data
    final rows = List.generate(7, (i) {
      final time = "12-04-2023 07:${(20 + i * 5).toString().padLeft(2, '0')}";
      final v = "123456.9";
      return {
        'no': '${i + 1}',
        'time': time,
        'pv': [v, v, v],
        'grid': [v, v],
        'out': [v, v, v, v],
      };
    });

    pdf.addPage(
      pw.MultiPage(
        pageFormat: format,
        margin: const pw.EdgeInsets.all(24),
        build: (context) {
          return [
            // Header
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text("SOGE",
                        style: pw.TextStyle(
                            fontSize: 26,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.green)),
                    pw.SizedBox(height: 2),
                    pw.Text("SOLAR GREEN ENERGY CAMBODIA",
                        style: pw.TextStyle(fontSize: 9)),
                  ],
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Text("កាលបរិច្ឆេទ: 17-01-2024"),
                    pw.Text("ឈ្មោះអតិថិជន: គំរូ"),
                    pw.Text("លេខអតិថិជន: ########"),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 18),
            // Title
            pw.Center(
                child: pw.Text("បាយការណ៍ប្រវត្តិអាំងវែកទ័រ",
                    style: pw.TextStyle(
                        fontSize: 15, fontWeight: pw.FontWeight.bold))),
            pw.SizedBox(height: 14),

            // No, Date, PVGroup, GridGroup, OutputGroup
            pw.Table(
              columnWidths: {
                0: pw.FixedColumnWidth(col0),
                1: pw.FixedColumnWidth(col1),
                2: pw.FixedColumnWidth(pvWidth),
                3: pw.FixedColumnWidth(gridWidth),
                4: pw.FixedColumnWidth(outputWidth),
              },
              border: pw.TableBorder(
                top: const pw.BorderSide(width: 1),
                left: const pw.BorderSide(width: 1),
                right: const pw.BorderSide(width: 1),
                bottom: const pw.BorderSide(width: 1),
                verticalInside: const pw.BorderSide(width: 1),
                // horizontalInside:
                //     const pw.BorderSide(width: 0, color: PdfColors.black),
              ),
              children: [
                // header top
                pw.TableRow(
                  children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.symmetric(vertical: 8),
                      alignment: pw.Alignment.center,
                      child: pw.Text("ល.រ", style: headerStyle),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.symmetric(vertical: 8),
                      alignment: pw.Alignment.center,
                      child: pw.Text("កាលបរិច្ឆេទ", style: headerStyle),
                    ),
                    // PV group
                    pw.Container(
                      padding: const pw.EdgeInsets.symmetric(vertical: 8),
                      alignment: pw.Alignment.center,
                      child: pw.Text("PV",
                          style: headerStyle.copyWith(color: PdfColors.green)),
                    ),
                    // Grid group
                    pw.Container(
                      padding: const pw.EdgeInsets.symmetric(vertical: 8),
                      alignment: pw.Alignment.center,
                      child: pw.Text("Grid",
                          style: headerStyle.copyWith(
                              color: PdfColor.fromInt(0xFFFB9A6A))),
                    ),
                    // Output group
                    pw.Container(
                      padding: const pw.EdgeInsets.symmetric(vertical: 8),
                      alignment: pw.Alignment.center,
                      child: pw.Text("Output",
                          style: headerStyle.copyWith(color: PdfColors.red)),
                    ),
                  ],
                ),
                // header units
                pw.TableRow(
                  children: [
                    // small blank underlining for first two columns
                    pw.Container(
                      padding: const pw.EdgeInsets.symmetric(vertical: 6),
                      decoration: const pw.BoxDecoration(
                        border: pw.Border(bottom: pw.BorderSide(width: 1)),
                      ),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.symmetric(
                        vertical: 6,
                      ),
                      decoration: const pw.BoxDecoration(
                        border: pw.Border(bottom: pw.BorderSide(width: 1)),
                      ),
                    ),

                    // PV sub (kW A V)
                    pw.Container(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      decoration: const pw.BoxDecoration(
                        border: pw.Border(bottom: pw.BorderSide(width: 1)),
                      ),
                      child: pw.Row(
                        children: [
                          pw.Container(
                              width: subColW,
                              alignment: pw.Alignment.center,
                              child: pw.Text("kW", style: smallStyle)),
                          pw.Container(
                              width: subColW,
                              alignment: pw.Alignment.center,
                              child: pw.Text("A", style: smallStyle)),
                          pw.Container(
                              width: subColW,
                              alignment: pw.Alignment.center,
                              child: pw.Text("V", style: smallStyle)),
                        ],
                      ),
                    ),

                    // Grid sub (A V)
                    pw.Container(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      decoration: const pw.BoxDecoration(
                        border: pw.Border(bottom: pw.BorderSide(width: 1)),
                      ),
                      child: pw.Row(
                        children: [
                          pw.Container(
                              width: subColW,
                              alignment: pw.Alignment.center,
                              child: pw.Text("A", style: smallStyle)),
                          pw.Container(
                              width: subColW,
                              alignment: pw.Alignment.center,
                              child: pw.Text("V", style: smallStyle)),
                        ],
                      ),
                    ),

                    // Output sub (kWh A V Hz)
                    pw.Container(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      decoration: const pw.BoxDecoration(
                        border: pw.Border(bottom: pw.BorderSide(width: 1)),
                      ),
                      child: pw.Row(
                        children: [
                          pw.Container(
                              width: subColW,
                              alignment: pw.Alignment.center,
                              child: pw.Text("kWh", style: smallStyle)),
                          pw.Container(
                              width: subColW,
                              alignment: pw.Alignment.center,
                              child: pw.Text("A", style: smallStyle)),
                          pw.Container(
                              width: subColW,
                              alignment: pw.Alignment.center,
                              child: pw.Text("V", style: smallStyle)),
                          pw.Container(
                              width: subColW,
                              alignment: pw.Alignment.center,
                              child: pw.Text("Hz", style: smallStyle)),
                        ],
                      ),
                    ),
                  ],
                ),

                // data row
                ...rows.map((r) {
                  return pw.TableRow(
                    children: [
                      // No.
                      pw.Container(
                        padding: const pw.EdgeInsets.symmetric(
                            vertical: 8, horizontal: 6),
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text(r['no'] as String, style: smallStyle),
                      ),
                      // Date/time
                      pw.Container(
                        padding: const pw.EdgeInsets.symmetric(
                            vertical: 8, horizontal: 6),
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text(r['time'] as String, style: smallStyle),
                      ),
                      // PV values
                      pw.Container(
                        padding: const pw.EdgeInsets.symmetric(
                            vertical: 6, horizontal: 4),
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: (r['pv'] as List<String>).map((v) {
                            return pw.Container(
                              width: subColW,
                              child: pw.Align(
                                  alignment: pw.Alignment.centerRight,
                                  child: pw.Text(v, style: smallStyle)),
                            );
                          }).toList(),
                        ),
                      ),
                      // Grid values
                      pw.Container(
                        padding: const pw.EdgeInsets.symmetric(
                            vertical: 2, horizontal: 4),
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: (r['grid'] as List<String>).map((v) {
                            return pw.Container(
                              width: subColW,
                              child: pw.Align(
                                  alignment: pw.Alignment.centerRight,
                                  child: pw.Text(v, style: smallStyle)),
                            );
                          }).toList(),
                        ),
                      ),
                      // Output values
                      pw.Container(
                        padding: const pw.EdgeInsets.symmetric(
                            vertical: 6, horizontal: 4),
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: (r['out'] as List<String>).map((v) {
                            return pw.Container(
                              width: subColW,
                              child: pw.Align(
                                  alignment: pw.Alignment.centerRight,
                                  child: pw.Text(v, style: smallStyle)),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ],
            ),

            pw.SizedBox(height: 18),

            pw.Container(
              margin: pw.EdgeInsets.only(left: col0 + col1, right: 0),
              height: 1,
              color: PdfColors.grey800,
            ),

            pw.SizedBox(height: 10),

            // Summary row each param
            pw.Row(
              children: [
                pw.Container(width: col0),
                pw.Container(
                    width: col1,
                    child: pw.Align(
                      alignment: pw.Alignment.centerRight,
                      child: pw.Text("តម្លៃសរុប", style: smallStyle),
                    )),
                pw.Container(
                  padding: const pw.EdgeInsets.only(left: 6),
                  child: pw.Wrap(
                    spacing: 12,
                    children: [
                      pw.SizedBox(width: 4),
                      pw.Text("123456.7", style: smallStyle),
                      pw.Text("123456.7", style: smallStyle),
                      pw.Text("123456.7", style: smallStyle),
                      pw.Text("123456.7", style: smallStyle),
                      pw.Text("123456.7", style: smallStyle),
                      pw.Text("123456.7", style: smallStyle),
                      pw.Text("123456.7", style: smallStyle),
                      pw.Text("123456.7", style: smallStyle),
                      pw.Text("123456.7", style: smallStyle),
                    ],
                  ),
                ),
              ],
            ),

            //
            pw.SizedBox(height: 20),
            pw.Padding(
              padding: pw.EdgeInsets.only(left: col0 + col0 + col1),
              child: pw.Table(
                  border: pw.TableBorder(
                    top: const pw.BorderSide(width: 1),
                    left: const pw.BorderSide(width: 1),
                    right: const pw.BorderSide(width: 1),
                    bottom: const pw.BorderSide(width: 1),
                  ),
                  children: [
                    pw.TableRow(children: [
                      pw.SizedBox(width: 100),
                      pw.SizedBox(
                        width: 128,
                        child: pw.Align(
                          alignment: pw.Alignment.center,
                          child: pw.Text('PV'),
                        ),
                      ),
                      pw.SizedBox(
                        width: 128,
                        child: pw.Align(
                          alignment: pw.Alignment.center,
                          child: pw.Text('Grid'),
                        ),
                      ),
                      pw.SizedBox(
                        width: 128,
                        child: pw.Align(
                          alignment: pw.Alignment.center,
                          child: pw.Text('Output'),
                        ),
                      ),
                    ]),
                    pw.TableRow(children: [
                      pw.SizedBox(height: 10),
                    ]),
                    pw.TableRow(children: [
                      pw.Container(
                        width: 128,
                        child: pw.Align(
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text('តម្លៃសរុប'),
                        ),
                      ),
                      pw.Container(
                        width: 128,
                        child: pw.Align(
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text('123456.1 kw'),
                        ),
                      ),
                      pw.Container(
                        width: 128,
                        child: pw.Align(
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text('123456.1 kHw'),
                        ),
                      ),
                      pw.Container(
                        width: 128,
                        child: pw.Align(
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text('123456.1 kh'),
                        ),
                      ),
                    ]),
                  ]),
            ),
          ];
        },
      ),
    );

    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Preview')),
      body: PdfPreview(
        build: (format) => _generatePdf(format),
      ),
    );
  }
}

import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> exportPdf(
    {String nameInverter = '',
    String nameStation = '',
    double pv_v = 0,
    double pv_a = 0,
    double pv = 0,
    double grid = 0,
    double grid_a = 0,
    double output_v = 0,
    double output_a = 0,
    double output = 0,
    double output_hz = 0}) async {
  final pdf = pw.Document();
  final khmerFont = pw.Font.ttf(
      await rootBundle.load('assets/fonts/KantumruyPro_Regular.ttf'));
  // pv_v = 1022.0;

  pdf.addPage(pw.Page(build: (context) {
    return pw
        .Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
      // Header
      pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Text(
          'SOGE',
          style: pw.TextStyle(
            color: PdfColors.green,
            fontSize: 24,
          ),
        ),
        pw.Text(
          'Solar Green Energy Cambodia',
          style: pw.TextStyle(
            color: PdfColors.black,
            fontSize: 18,
          ),
        ),
        pw.SizedBox(height: 10),
        pw.Text(
          'កាលបរិច្ឆេទ',
          style: pw.TextStyle(
            color: PdfColors.black,
            fontSize: 16,
            font: khmerFont,
          ),
        ),
        pw.Text(
          'ស្ថានីយ៍',
          style: pw.TextStyle(
            color: PdfColors.black,
            fontSize: 16,
            font: khmerFont,
          ),
        ),
        pw.Text(
          'អាំងវែកទ័រ',
          style: pw.TextStyle(
            color: PdfColors.black,
            fontSize: 16,
            font: khmerFont,
          ),
        ),
      ]),
      pw.SizedBox(height: 10),
      // Title
      pw.Align(
          alignment: pw.Alignment.center,
          child: pw.Text(
            'របាយការណ៍ប្រវត្តិអាំងវែកទ័រ',
            style: pw.TextStyle(
                color: PdfColors.black, fontSize: 18, font: khmerFont),
          )),
      // Table
      pw.SizedBox(height: 5),
      pw.Container(
          decoration: pw.BoxDecoration(
              border: pw.Border.all(width: 1, color: PdfColors.black)),
          padding: pw.EdgeInsets.all(3),
          child: pw.Column(children: [
            // Main Table
            pw.Table(
              border: pw.TableBorder(
                horizontalInside: pw.BorderSide(width: 1),
                verticalInside: pw.BorderSide(width: 1),
              ),
              columnWidths: {
                0: pw.FixedColumnWidth(30), // NO
                1: pw.FixedColumnWidth(80), // Date time
                2: pw.FlexColumnWidth(3), // PV
                3: pw.FlexColumnWidth(2), // Grid
                4: pw.FlexColumnWidth(4), // Output
              },
              children: [
                // header row
                pw.TableRow(children: [
                  cellHeader(text: 'NO', color: PdfColors.black),
                  cellHeader(text: 'Date time', color: PdfColors.black),
                  pw.Column(children: [
                    cellHeader(text: 'PV', color: PdfColors.green),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        cellContent(text: 'V'),
                        cellContent(text: 'A'),
                        cellContent(text: 'kW'),
                      ],
                    ),
                  ]),
                  pw.Column(children: [
                    cellHeader(text: 'Grid', color: PdfColors.orange),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        cellContent(text: 'V'),
                        cellContent(text: 'A'),
                      ],
                    ),
                  ]),
                  pw.Column(children: [
                    cellHeader(text: 'Output', color: PdfColors.red),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        cellContent(text: 'V'),
                        cellContent(text: 'A'),
                        cellContent(text: 'kW'),
                        cellContent(text: 'Hz'),
                      ],
                    ),
                  ]),
                ]),
                // content row
                // 100,000
                pw.TableRow(children: [
                  cellContent(text: '1'),
                  cellContent(text: '12-02-2024'),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        cellContent(text: pv_v.toString()),
                        cellContent(text: pv_a.toString()),
                        cellContent(text: pv.toString()),
                      ]),
                  pw.Row(children: [
                    cellContent(text: grid_a.toString()),
                    cellContent(text: grid.toString()),
                  ]),
                  pw.Row(children: [
                    cellContent(text: output_v.toString()),
                    cellContent(text: output_a.toString()),
                    cellContent(text: output.toString()),
                    cellContent(text: output_hz.toString()),
                  ]),
                ]),
              ],
            ),
            pw.SizedBox(height: 8),
            // Summary
            pw.Align(
              alignment: pw.Alignment.centerRight,
              child: pw.SizedBox(
                width: 450,
                child: pw.Table(
                  border: pw.TableBorder(top: pw.BorderSide(width: 1)),
                  columnWidths: {
                    0: pw.FixedColumnWidth(80),
                    1: pw.FlexColumnWidth(3), // PV
                    2: pw.FlexColumnWidth(2), // Grid
                    3: pw.FlexColumnWidth(4), // Output
                  },
                  children: [
                    pw.TableRow(
                        verticalAlignment: pw.TableCellVerticalAlignment.middle,
                        children: [
                          pw.Text('សរុប',
                              style:
                                  pw.TextStyle(font: khmerFont, fontSize: 9)),
                          pw.Row(children: [
                            cellContent(text: '120230.3'),
                            cellContent(text: '120230.3'),
                            cellContent(text: '120230.3'),
                          ]),
                          pw.Row(children: [
                            cellContent(text: '120230.3'),
                            cellContent(text: '120230.3'),
                          ]),
                          pw.Row(children: [
                            cellContent(text: '120230.3'),
                            cellContent(text: '120230.3'),
                            cellContent(text: '120230.3'),
                            cellContent(text: '120230.3'),
                          ]),
                        ]),
                  ],
                ),
              ),
            ),

            pw.SizedBox(height: 16),
            pw.Padding(
              padding: pw.EdgeInsets.only(right: 16),
              child: pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Container(
                    width: 300,
                    decoration: pw.BoxDecoration(
                        border: pw.Border.all(width: 1, color: PdfColors.black),
                        color: PdfColors.grey200),
                    padding: pw.EdgeInsets.all(8),
                    child: pw.Table(children: [
                      pw.TableRow(
                          decoration:
                              pw.BoxDecoration(color: PdfColors.grey500),
                          children: [
                            pw.Text(''),
                            pw.Text('PV'),
                            pw.Text('Grid'),
                            pw.Text('Output'),
                          ]),
                      pw.TableRow(children: [
                        pw.Text('សរុប', style: pw.TextStyle(font: khmerFont)),
                        pw.Row(children: [
                          pw.Text('123.2',
                              style: pw.TextStyle(color: PdfColors.green)),
                          pw.SizedBox(width: 5),
                          pw.Text('kW',
                              style: pw.TextStyle(color: PdfColors.grey500)),
                        ]),
                        pw.Row(children: [
                          pw.Text('123.2',
                              style: pw.TextStyle(color: PdfColors.orange)),
                          pw.SizedBox(width: 5),
                          pw.Text('kWh',
                              style: pw.TextStyle(color: PdfColors.grey500)),
                        ]),
                        pw.Row(children: [
                          pw.Text('123.2',
                              style: pw.TextStyle(color: PdfColors.red)),
                          pw.SizedBox(width: 5),
                          pw.Text('kw',
                              style: pw.TextStyle(color: PdfColors.grey500)),
                        ]),
                      ]),
                    ])),
              ),
            ),
          ])),
    ]);
  }));

  return pdf.save();
}

pw.Widget cellHeader({required String text, required PdfColor color}) {
  return pw.Padding(
    padding: pw.EdgeInsets.symmetric(horizontal: 6, vertical: 4),
    child: pw.Text(text,
        style: pw.TextStyle(
            fontSize: 12, fontWeight: pw.FontWeight.bold, color: color)),
  );
}

pw.Widget cellContent({required String text}) {
  // final khmerFont = pw.Font.ttf(
  //     await rootBundle.load('assets/fonts/KantumruyPro_Regular.ttf'));
  return pw.Padding(
    padding: pw.EdgeInsets.symmetric(horizontal: 2, vertical: 6),
    child: pw.Text(text,
        // overflow: pw.TextOverflow.visible,
        style: pw.TextStyle(
          fontSize: 9,
        )),
  );
}

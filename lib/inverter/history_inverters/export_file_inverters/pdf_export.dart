import 'dart:typed_data';
import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> makePdf(PdfPageFormat format) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.MultiPage(
      pageFormat: format,
      margin: const pw.EdgeInsets.all(20),
      build: (pw.Context context) {
        return [
          // Header
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text("SOGE",
                  style: pw.TextStyle(
                    fontSize: 28,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.green,
                  )),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text("កាលបរិច្ឆេទ 17-01-2024"),
                  pw.Text("ឈ្មោះអតិថិជន៖ អគ្គិសនី"),
                  pw.Text("លេខអតិថិជន ########"),
                ],
              ),
            ],
          ),
          pw.SizedBox(height: 20),

          pw.Center(
            child: pw.Text(
              "បាយការណ៍ប្រព័ន្ធសំរាប់អតិថិជនប្រើប្រាស់",
              style: pw.TextStyle(
                fontSize: 16,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),

          pw.SizedBox(height: 20),

          // Table
          pw.Table.fromTextArray(
            border: pw.TableBorder.all(),
            headers: [
              "ល.រ",
              "ថ្ងៃខែឆ្នាំ",
              "PV\nkW",
              "A",
              "V",
              "Grid\nA",
              "V",
              "Output\nkWh",
              "A",
              "V",
              "Hz",
            ],
            headerStyle: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              fontSize: 10,
            ),
            cellStyle: const pw.TextStyle(fontSize: 9),
            data: List.generate(
              7,
              (index) => [
                (index + 1).toString(),
                "12-04-2023 07:${20 + index * 5}",
                "123456.789",
                "123456.789",
                "123456.789",
                "123456.789",
                "123456.789",
                "123456.789",
                "123456.789",
                "123456.789",
                "123456.789",
              ],
            ),
          ),

          pw.SizedBox(height: 20),

          // Summary Row
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Text("សរុបរួម: ",
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 12)),
              pw.Text("123456.789",
                  style: pw.TextStyle(color: PdfColors.green)),
              pw.SizedBox(width: 10),
              pw.Text("123456.789",
                  style: pw.TextStyle(color: PdfColors.green)),
              pw.SizedBox(width: 10),
              pw.Text("123456.789",
                  style: pw.TextStyle(color: PdfColors.green)),
              pw.SizedBox(width: 10),
              pw.Text("123456.789", style: pw.TextStyle(color: PdfColors.red)),
              pw.SizedBox(width: 10),
              pw.Text("123456.789", style: pw.TextStyle(color: PdfColors.red)),
            ],
          ),

          pw.SizedBox(height: 30),

          // Box Summary
          pw.Container(
            padding: const pw.EdgeInsets.all(10),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: PdfColors.grey),
            ),
            child: pw.Column(
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                  children: [
                    pw.Text("PV",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text("Grid",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text("Output",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ],
                ),
                pw.Divider(),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                  children: [
                    pw.Text("123456.789 kW",
                        style: pw.TextStyle(color: PdfColors.green)),
                    pw.Text("123456.789 kWh",
                        style: pw.TextStyle(color: PdfColors.red)),
                    pw.Text("123456.789 kW",
                        style: pw.TextStyle(color: PdfColors.red)),
                  ],
                ),
              ],
            ),
          ),
        ];
      },
    ),
  );

  return pdf.save();
}

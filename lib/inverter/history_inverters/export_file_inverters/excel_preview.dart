import 'package:flutter/material.dart';
import 'package:solar_management_system/style/app_colors.dart';

class ExcelPreview extends StatelessWidget {
  const ExcelPreview({super.key});

  @override
  Widget build(BuildContext context) {
    // Column widths
    const double col0 = 40;
    const double col1 = 130;
    const double subColW = 90;
    const double pvWidth = subColW * 3;
    const double gridWidth = subColW * 2;
    const double outputWidth = subColW * 4;
    final double tableWidth =
        col0 + col1 + pvWidth + gridWidth + outputWidth + 50;

    // Fake data
    final rows = List.generate(7, (i) {
      final time = "12-04-2023 07:${(20 + i * 5).toString().padLeft(2, '0')}";
      final v = "123456.789";
      return {
        'no': '${i + 1}',
        'time': time,
        'pv': [v, v, v],
        'grid': [v, v],
        'out': [v, v, v, v],
      };
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Excel-like Preview"),
        backgroundColor: AppColor.background,
      ),
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: tableWidth,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header above table
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "SOGE",
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          Text(
                            "Solar Green Energy Cambody",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Text("កាលបរិច្ឆេទ 17-01-2024"),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Table container
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Column(
                      children: [
                        // Header row
                        Row(
                          children: [
                            _headerCell("ល.រ", width: col0),
                            _headerCell("ថ្ងៃខែឆ្នាំ", width: col1),
                            _headerCell("PV",
                                width: pvWidth, color: Colors.green),
                            _headerCell("Grid",
                                width: gridWidth, color: Colors.orange),
                            _headerCell("Output",
                                width: outputWidth, color: Colors.red),
                          ],
                        ),
                        // Units row
                        Row(
                          children: [
                            _headerCell("", width: col0),
                            _headerCell("", width: col1),
                            _unitRow(["kW", "A", "V"], subColW),
                            _unitRow(["A", "V"], subColW),
                            _unitRow(["kWh", "A", "V", "Hz"], subColW),
                          ],
                        ),
                        Container(height: 1, color: Colors.black),

                        // Data rows
                        ...rows.map((r) {
                          return Row(
                            children: [
                              _dataCell(r['no'] as String,
                                  width: col0, align: Alignment.center),
                              _dataCell(r['time'] as String,
                                  width: col1,
                                  align: Alignment.centerLeft,
                                  withRightBorder: true),
                              _dataRow(r['pv'] as List<String>, subColW,
                                  withRightBorder: true),
                              _dataRow(r['grid'] as List<String>, subColW,
                                  withRightBorder: true),
                              _dataRow(r['out'] as List<String>, subColW),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("សង្ខេបសរុប",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 16),
                      Text("123456.7",
                          style: TextStyle(color: Colors.green[700])),
                      const SizedBox(width: 12),
                      Text("123456.7",
                          style: TextStyle(color: Colors.green[700])),
                      const SizedBox(width: 12),
                      Text("123456.7",
                          style: TextStyle(color: Colors.green[700])),
                      const SizedBox(width: 12),
                      Text("123456.7",
                          style: TextStyle(color: Colors.orange[700])),
                      const SizedBox(width: 12),
                      Text("123456.7",
                          style: TextStyle(color: Colors.red[700])),
                      const SizedBox(width: 12),
                      Text("123456.7",
                          style: TextStyle(color: Colors.red[700])),
                      const SizedBox(width: 12),
                      Text("123456.7",
                          style: TextStyle(color: Colors.red[700])),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: 500,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.grey.shade200,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header row inside box
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            SizedBox(width: 100),
                            Expanded(
                              child: Center(
                                child: Text("PV",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text("Grid",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text("Output",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: Text("សង្ខេបសរុប ",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Expanded(
                              child: Center(
                                child: Text("123456.7 kW",
                                    style: TextStyle(color: Colors.green[700])),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text("123456.7 kWh",
                                    style:
                                        TextStyle(color: Colors.orange[700])),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text("123456.7 kW",
                                    style: TextStyle(color: Colors.red[700])),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- Helpers ---
  static Widget _headerCell(String text,
      {required double width, Color? color}) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      child: Text(text,
          style: TextStyle(fontWeight: FontWeight.bold, color: color)),
    );
  }

  static Widget _unitRow(List<String> units, double colWidth) {
    return Row(
      children: units.map((u) {
        return Container(
          width: colWidth,
          padding: const EdgeInsets.all(6),
          alignment: Alignment.center,
          child: Text(u, style: const TextStyle(fontSize: 12)),
        );
      }).toList(),
    );
  }

  static Widget _dataCell(String text,
      {required double width,
      Alignment align = Alignment.centerRight,
      bool withRightBorder = false}) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      alignment: align,
      decoration: BoxDecoration(
        border: Border(
          right: withRightBorder
              ? const BorderSide(color: Colors.black)
              : BorderSide.none,
        ),
      ),
      child: Text(text),
    );
  }

  static Widget _dataRow(List<String> values, double colWidth,
      {bool withRightBorder = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: withRightBorder
              ? const BorderSide(color: Colors.black)
              : BorderSide.none,
        ),
      ),
      child: Row(
        children: values.map((v) {
          return Container(
            width: colWidth,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
            alignment: Alignment.centerRight,
            child: Text(v),
          );
        }).toList(),
      ),
    );
  }
}

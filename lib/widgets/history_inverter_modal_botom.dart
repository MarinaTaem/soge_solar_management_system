import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:solar_management_system/inverter/history_inverters/export_file_inverters/excel_preview.dart';
import 'package:solar_management_system/inverter/history_inverters/export_file_inverters/export_file_dashboard.dart';
import 'package:solar_management_system/inverter/history_inverters/export_file_inverters/pdf_export.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/utils/datetime_helper.dart';

class HistoryInverterModalBotom extends StatefulWidget {
  DateTime date;
  late double pv_v = 1.0;
  late double pv_a = 2.0;
  late double pv = 3.0;
  late double grid_a = 4.0;
  late double grid = 5.0;
  late double output_v = 6.0;
  late double output_a = 7.0;
  late double output = 8.0;
  late double output_hz = 9.0;
  HistoryInverterModalBotom(
      {super.key,
      required this.date,
      required this.pv_v,
      required this.pv_a,
      required this.pv,
      required this.grid_a,
      required this.grid,
      required this.output_v,
      required this.output_a,
      required this.output,
      required this.output_hz});

  @override
  State<HistoryInverterModalBotom> createState() =>
      _HistoryInverterModalBotomState();
}

class _HistoryInverterModalBotomState extends State<HistoryInverterModalBotom> {
  bool isTapPdfExport = false;
  bool isTapExcelExport = false;

  Future<void> sharePdf() async {
    // Show loading while generate pdf
    showDialog(
      context: context,
      builder: (_) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    // Generate pdf bytes
    final Uint8List pdfBytes = await exportPdf();
    // Save to temp file
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/report.pdf');
    await file.writeAsBytes(pdfBytes);
    // Close dialog
    if (!mounted) return;
    Navigator.pop(context);
    // Share
    await SharePlus.instance.share(ShareParams(
      text: 'Report inverter',
      files: [XFile(file.path)],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      child: Column(
        children: [
          // date
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: AppColor.textPrimary,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/export.svg',
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'កាលបរិច្ឆេទ ${DatetimeHelper.formatDay(widget.date)}',
                    style: TextStyle(color: AppColor.primary, fontSize: 16),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 10,
              children: [
                // PDF export
                _rowModalBottomSheet(
                  'ទាញយកជា PDF',
                  'assets/images/history.svg',
                  isOnTap: isTapPdfExport,
                  onPressed: () {
                    setState(() {
                      isTapPdfExport = !isTapPdfExport;
                    });
                    // Navigator.pop(context);
                    sharePdf();
                    Navigator.pop(context);

                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //       builder: (context) => ExportFileDashboard(
                    //             date: widget.date,
                    //             // navigate: AppRoute.pdfInvertersHistory,
                    //             pv_v: widget.pv_v,
                    //             pv_a: widget.pv_a,
                    //             pv: widget.pv,
                    //             grid_a: widget.grid_a,
                    //             grid: widget.grid,
                    //             output_v: widget.output_v,
                    //             output_a: widget.output_a,
                    //             output: widget.output,
                    //             output_hz: widget.output_hz,
                    //           )
                    //       // PdfPreviewScreen(),
                    //       ),
                    // );
                  },
                ),
                // Excel export
                _rowModalBottomSheet(
                  'ទាញយកជា Excel',
                  'assets/images/conf_param.svg',
                  isOnTap: isTapExcelExport,
                  onPressed: () {
                    setState(() {
                      isTapExcelExport = !isTapExcelExport;
                    });
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ExcelPreview(),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _rowModalBottomSheet(String feature, String icon,
      {bool isOnTap = false, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isOnTap ? AppColor.bluskyLight : AppColor.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                icon,
                colorFilter:
                    ColorFilter.mode(AppColor.textSecondary, BlendMode.srcIn),
              ),
            ),
            SizedBox(width: 5),
            Text(
              feature,
              style: TextStyle(fontSize: 16, color: AppColor.textPrimary),
            ),
          ],
        ),
      ),
    );
  }
}

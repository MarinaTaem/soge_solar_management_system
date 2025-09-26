import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solar_management_system/inverter/history_inverters/export_file_inverters/excel_preview.dart';
import 'package:solar_management_system/inverter/history_inverters/export_file_inverters/pdf_preview_screen.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/utils/datetime_helper.dart';

class HistoryInverterModalBotom extends StatefulWidget {
  DateTime date;
  HistoryInverterModalBotom({super.key, required this.date});

  @override
  State<HistoryInverterModalBotom> createState() =>
      _HistoryInverterModalBotomState();
}

class _HistoryInverterModalBotomState extends State<HistoryInverterModalBotom> {
  bool isTapPdfExport = false;
  bool isTapExcelExport = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      child: Column(
        children: [
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
                    'កាលបរិច្ឆេទ ${DatetimeHelper.formatToday(widget.date)}',
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
                // View history
                _rowModalBottomSheet(
                  'ទាញយកជា PDF',
                  'assets/images/history.svg',
                  isOnTap: isTapExcelExport,
                  onPressed: () {
                    setState(() {
                      isTapPdfExport = !isTapPdfExport;
                    });
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const PdfPreviewScreen(),
                      ),
                    );
                  },
                ),
                // Config param
                _rowModalBottomSheet(
                  'ទាញយកជា Excel',
                  'assets/images/conf_param.svg',
                  isOnTap: isTapExcelExport,
                  onPressed: () {
                    setState(() {
                      isTapExcelExport = !isTapExcelExport;
                    });
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
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

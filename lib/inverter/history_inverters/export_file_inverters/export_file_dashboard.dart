import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:solar_management_system/inverter/history_inverters/export_file_inverters/pdf_export.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/style/app_text_style.dart';
import 'package:solar_management_system/utils/datetime_helper.dart';

class ExportFileDashboard extends StatefulWidget {
  final DateTime date;
  // String navigate;
  late double pv_v;
  late double pv_a;
  late double pv;
  late double grid_a;
  late double grid;
  late double output_v;
  late double output_a;
  late double output;
  late double output_hz;

  ExportFileDashboard(
      {required this.date,
      // required this.navigate,
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
  State<ExportFileDashboard> createState() => _ExportFileDashboardState();
}

class _ExportFileDashboardState extends State<ExportFileDashboard> {
  bool? pv_v = false;
  bool? pv_a = false;
  bool? pv = true;
  bool? grid_a = false;
  bool? grid = true;
  bool? output_v = false;
  bool? output_a = false;
  bool? output = true;
  bool? output_hz = false;

  // bool selectedValue(bool isSelected) {
  //   if (isSelected = false) {
  //     return null;
  //   }
  //   return isSelected;
  // }

  double pv_v_vlaue() {
    if (pv_v = true) {
      return widget.pv_v;
    }
    return 0;
  }

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
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        automaticallyImplyLeading: false, // This disables the back button
        title: Text(
          'ទាញយកព័ត៌មានអាំងវែកទ័រ',
          style: TextStyle(
              fontFamily: 'Khmer', fontSize: 20, color: AppColor.textPrimary),
        ),
        centerTitle: true,
        backgroundColor: AppColor.background,
        elevation: 0, // Remove shadow if needed
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Shadow title
            Container(
              height: 1,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: const Color.fromARGB(255, 20, 35, 45),
                    offset: Offset(0, 2),
                    blurRadius: 2)
              ]),
            ),
            // Options & bottom button
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        // title
                        Text(
                          'ជ្រើសរើសព័ត៌មានដែលត្រូវទាញយក',
                          style: TextStyle(
                              fontFamily: 'Khmer',
                              fontSize: 18,
                              color: AppColor.textPrimary,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        // Options
                        Container(
                          width: MediaQuery.of(context).size.width - 64,
                          decoration: BoxDecoration(
                              color: AppColor.textPrimary,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        const Color.fromARGB(255, 20, 35, 45),
                                    offset: Offset(1, 2),
                                    blurRadius: 2)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 32),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 20,
                              children: [
                                // date
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'កាលបរិច្ឆេទ៖​ ${DatetimeHelper.formatToday(widget.date)}',
                                      style: AppTextStyle.inActiveTitle,
                                    ),
                                    SizedBox(width: 5),
                                    IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          'assets/images/calendar_edit.svg',
                                          colorFilter: ColorFilter.mode(
                                              AppColor.bluskyLight,
                                              BlendMode.srcIn),
                                        ))
                                  ],
                                ),
                                // pv_v
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'PV voltage (V)',
                                      style: AppTextStyle.bodyPrimaryBlue,
                                    ),
                                    SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: Transform.scale(
                                        scale: 1.1,
                                        child: Checkbox(
                                            value: pv_v,
                                            checkColor: AppColor.textPrimary,
                                            activeColor: AppColor.bluskyLight,
                                            side: BorderSide(
                                                color: AppColor.unfocus),
                                            onChanged: (bool? value) {
                                              setState(() {
                                                pv_v = value;
                                                print('Value PV_V = ${pv_v}');
                                              });
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                                // pv_a
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'PV input current (A)',
                                      style: AppTextStyle.bodyPrimaryBlue,
                                    ),
                                    SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: Transform.scale(
                                        scale: 1.1,
                                        child: Checkbox(
                                            value: pv_a,
                                            checkColor: AppColor.textPrimary,
                                            activeColor: AppColor.bluskyLight,
                                            side: BorderSide(
                                                color: AppColor.unfocus),
                                            onChanged: (bool? value) {
                                              setState(() {
                                                pv_a = value;
                                                print('Value PV_A = ${pv_a}');
                                              });
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                                // pv
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'PV power (kW)',
                                      style: AppTextStyle.bodyPrimaryBlue,
                                    ),
                                    SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: Transform.scale(
                                        scale: 1.1,
                                        child: Checkbox(
                                            value: pv,
                                            checkColor: AppColor.textPrimary,
                                            activeColor: AppColor.bluskyLight,
                                            side: BorderSide(
                                                color: AppColor.unfocus),
                                            onChanged: (bool? value) {
                                              setState(() {
                                                pv = value;
                                                print('Value PV_V = ${pv}');
                                              });
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                                // grid_a
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Grid (A)',
                                      style: AppTextStyle.bodyPrimaryBlue,
                                    ),
                                    SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: Transform.scale(
                                        scale: 1.1,
                                        child: Checkbox(
                                            value: grid_a,
                                            checkColor: AppColor.textPrimary,
                                            activeColor: AppColor.bluskyLight,
                                            side: BorderSide(
                                                color: AppColor.unfocus),
                                            onChanged: (bool? value) {
                                              setState(() {
                                                grid_a = value;
                                                print(
                                                    'Value Grid_a = ${grid_a}');
                                              });
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                                // grid
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Grid (kWh)',
                                      style: AppTextStyle.bodyPrimaryBlue,
                                    ),
                                    SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: Transform.scale(
                                        scale: 1.1,
                                        child: Checkbox(
                                            value: grid,
                                            checkColor: AppColor.textPrimary,
                                            activeColor: AppColor.bluskyLight,
                                            side: BorderSide(
                                                color: AppColor.unfocus),
                                            onChanged: (bool? value) {
                                              setState(() {
                                                grid = value;
                                                print('Value Grid = ${grid}');
                                              });
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                                // output_v
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Output voltage (V)',
                                      style: AppTextStyle.bodyPrimaryBlue,
                                    ),
                                    SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: Transform.scale(
                                        scale: 1.1,
                                        child: Checkbox(
                                            value: output_v,
                                            checkColor: AppColor.textPrimary,
                                            activeColor: AppColor.bluskyLight,
                                            side: BorderSide(
                                                color: AppColor.unfocus),
                                            onChanged: (bool? value) {
                                              setState(() {
                                                output_v = value;
                                                print(
                                                    'Value output_v = ${output_v}');
                                              });
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                                // output_a
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Output Current (A)',
                                      style: AppTextStyle.bodyPrimaryBlue,
                                    ),
                                    SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: Transform.scale(
                                        scale: 1.1,
                                        child: Checkbox(
                                            value: output_a,
                                            checkColor: AppColor.textPrimary,
                                            activeColor: AppColor.bluskyLight,
                                            side: BorderSide(
                                                color: AppColor.unfocus),
                                            onChanged: (bool? value) {
                                              setState(() {
                                                output_a = value;
                                                print(
                                                    'Value output_a = ${output_a}');
                                              });
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                                // output
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Output power (kWh)',
                                      style: AppTextStyle.bodyPrimaryBlue,
                                    ),
                                    SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: Transform.scale(
                                        scale: 1.1,
                                        child: Checkbox(
                                            value: output,
                                            checkColor: AppColor.textPrimary,
                                            activeColor: AppColor.bluskyLight,
                                            side: BorderSide(
                                                color: AppColor.unfocus),
                                            onChanged: (bool? value) {
                                              setState(() {
                                                output = value;
                                                print(
                                                    'Value output = ${output}');
                                              });
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                                // output_hz
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Output frequency (Hz)',
                                      style: AppTextStyle.bodyPrimaryBlue,
                                    ),
                                    SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: Transform.scale(
                                        scale: 1.1,
                                        child: Checkbox(
                                            value: output_hz,
                                            checkColor: AppColor.textPrimary,
                                            activeColor: AppColor.bluskyLight,
                                            side: BorderSide(
                                                color: AppColor.unfocus),
                                            onChanged: (bool? value) {
                                              setState(() {
                                                output_hz = value;
                                                print(
                                                    'Value output_f = ${output_hz}');
                                              });
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Button : deny / next
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.error,
                            foregroundColor: AppColor.textPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          icon: SvgPicture.asset(
                            'assets/images/trash.svg',
                            colorFilter: ColorFilter.mode(
                                AppColor.textPrimary, BlendMode.srcIn),
                          ),
                          label: const Text('បោះបង់'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              // selectedValue('');
                            });
                            // Navigator.pushNamed(
                            //     context, AppRoute.pdfInvertersHistory);

                            sharePdf();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.greenDark,
                            foregroundColor: AppColor.textPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('បន្ទាប់'),
                              SizedBox(width: 5),
                              SizedBox(
                                child: SvgPicture.asset(
                                  'assets/images/next_arrow.svg',
                                  colorFilter: ColorFilter.mode(
                                      AppColor.textPrimary, BlendMode.srcIn),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

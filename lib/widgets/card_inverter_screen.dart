import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solar_management_system/model/inverter_info_model.dart';
import 'package:solar_management_system/model/inverter_model.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/utils/text_auto_size_helper.dart';
import 'package:solar_management_system/widgets/inverter_modal_buttom_sheet.dart';

class CardInverterScreen extends StatefulWidget {
  final ParamInverter paramInverter;
  CardInverterScreen({super.key, required this.paramInverter});

  @override
  State<CardInverterScreen> createState() => _CardInverterScreenState();
}

class _CardInverterScreenState extends State<CardInverterScreen> {
  bool isSwitchedInverter = false;
  bool isSwitchedPv = false;
  bool isSwitchedGrid = false;
  bool isSwitchedOutput = false;
  bool isShowSwitched = true;
  bool isOnline = false;
  String nameInverter = 'Inverter 1';
  //
  double pv_power = 12;
  double pv_v = 32.02;
  double pv_a = 21.23;
  double grid_power = 29.0;
  double grid_a = 12.09;
  double out_power = 12.3;
  double out_v = 12.03;
  double out_a = 2.93;
  double out_hz = 1.02;

  //Test data inverter info
  InverterInfoModel inverterInfo = InverterInfoModel(
      nameInverter: '',
      serialNumber: 'No124242',
      model: 'Model 1',
      maxCapacity: 1100,
      rateEfficiency: 94.22,
      currentEfficiency: 93.93,
      totalOutput: 1213343.0,
      dateInstall: DateTime(2024, 2, 23),
      stationName: 'Station 1',
      status: false);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(255, 34, 60, 75),
              blurRadius: 3,
              offset: Offset(0, 3))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    spacing: 8,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: isOnline
                                  ? AppColor.greenLight
                                  : AppColor.error,
                              width: 2,
                              strokeAlign: BorderSide.strokeAlignOutside),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('assets/images/image_5.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Expanded(
                          child: SizedBox(
                        width: 90,
                        child: TextAutoSizeHelper(
                          text: 'text fdhfhd 3jjfd h helfo dfu12323 Hekko',
                          maxFontSize: 40,
                          minFontSize: 20,
                          style: TextStyle(color: AppColor.textPrimary),
                          maxLines: 1,
                        ),
                      )),
                      // Text(
                      //   'nameInverter',
                      //   style:
                      //       TextStyle(color: AppColor.textPrimary, fontSize: 15),
                      // )
                    ],
                  ),
                ),
                // switch button - inverter
                SizedBox(
                  width: 34,
                  height: 18,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Switch(
                      value: isSwitchedInverter,
                      activeTrackColor:
                          isOnline ? AppColor.greenDark : AppColor.error,
                      activeColor: AppColor.textSecondary,
                      inactiveTrackColor: AppColor.textSecondary,
                      inactiveThumbColor: AppColor.unfocus,
                      splashRadius: 16,
                      onChanged: (value) {
                        setState(() {
                          isSwitchedInverter = value;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            // PV
            _inverterRow(
              image: 'assets/images/pv.svg',
              power: pv_power,
              name: 'Philarvoltic',
              scale: 'kW',
              p1: "PV: $pv_v",
              p2: "PV: $pv_a",
              isSwitched: isSwitchedPv,
              isPv: true,
              onChanged: (value) {
                setState(() {
                  isSwitchedPv = value;
                });
              },
            ),
            // Grid
            const SizedBox(height: 5),
            _inverterRow(
                image: 'assets/images/grid.svg',
                power: grid_power,
                name: 'Grid',
                scale: 'kWh',
                p2: 'Grid: $grid_a',
                isSwitched: isSwitchedGrid,
                isGrid: true,
                onChanged: (value) {
                  setState(() {
                    isSwitchedGrid = value;
                  });
                }),
            // // Output
            const SizedBox(height: 5),
            _inverterRow(
                image: 'assets/images/energy.svg',
                power: out_power,
                name: 'Output',
                scale: 'kWh',
                p1: "Out.: $out_v",
                p2: "Out.: $out_a",
                p3: "Out.: $out_hz",
                isOutput: true,
                onChanged: (value) {
                  setState(() {
                    isSwitchedOutput = value;
                  });
                }),
            // Device horizontal
            const SizedBox(height: 10),
            Container(
              height: 1,
              width: double.infinity,
              color: AppColor.unfocus,
              margin: EdgeInsets.symmetric(horizontal: 48),
            ),
            // Bottom: date & setting btn
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Updated date: 01-02-2025 09:10',
                  style: TextStyle(fontSize: 12, color: AppColor.unfocus),
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: AppColor.background,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        builder: (BuildContext contect) {
                          return InverterModalButtomSheet(
                            paramInverter: widget.paramInverter,
                            isIverterOpen: false,
                            inverterInfoModel: inverterInfo,
                          );
                        });
                  },
                  icon: SvgPicture.asset(
                    'assets/images/setting.svg',
                    alignment: Alignment.centerRight,
                    // height: 24,
                    // width: 24,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _inverterRow(
      {String? image,
      double? power,
      String? name,
      String? scale,
      String? p1,
      String? p2,
      String? p3,
      bool isSwitched = false,
      bool isPv = false,
      bool isGrid = false,
      bool isOutput = false,
      required ValueChanged<bool> onChanged}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: SvgPicture.asset(image!),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 30,
                    child: TextAutoSizeHelper(
                      text: '$power',
                      maxFontSize: 20,
                      minFontSize: 12,
                      maxLines: 1,
                      style: TextStyle(color: AppColor.bluskyLight),
                    ),
                  ),
                  Text(
                    name!,
                    style: TextStyle(color: AppColor.textPrimary, fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Vertical devider
        Container(
          width: 1,
          height: 50,
          color: AppColor.unfocus,
          margin: EdgeInsets.symmetric(horizontal: 8),
        ),
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // parameter
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isGrid)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$p1 V',
                              style: TextStyle(
                                  color: AppColor.textSecondary, fontSize: 12),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      Text(
                        '$p2 A',
                        style: TextStyle(
                            color: AppColor.textSecondary, fontSize: 12),
                      ),
                      if (isOutput)
                        Text(
                          '$p3 hz',
                          style: TextStyle(
                              color: AppColor.textSecondary, fontSize: 12),
                        ),
                    ],
                  ),
                ),
              ),
              // Switch btn
              if (!isOutput)
                SizedBox(
                  height: 18,
                  width: 34,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Switch(
                      value: isSwitched,
                      activeTrackColor:
                          isOnline ? AppColor.greenDark : AppColor.error,
                      activeColor: AppColor.textSecondary,
                      inactiveTrackColor: AppColor.textSecondary,
                      inactiveThumbColor: AppColor.unfocus,
                      splashRadius: 16,
                      onChanged: onChanged,
                    ),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}

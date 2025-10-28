import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solar_management_system/model/inverter_info_model.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/utils/datetime_helper.dart';
import 'package:solar_management_system/utils/text_auto_size_helper.dart';

class InverterInfoScreen extends StatefulWidget {
  final InverterInfoModel inverterInfoModel;
  const InverterInfoScreen({
    super.key,
    required this.inverterInfoModel,
  });

  @override
  State<InverterInfoScreen> createState() => _InverterInfoScreenState();
}

class _InverterInfoScreenState extends State<InverterInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset('assets/images/arrow_back.svg')),
        title: Text(
          'ព័ត៌មានអាំងវែកទ័រ',
          style: TextStyle(color: AppColor.textPrimary),
        ),
        centerTitle: true,
        backgroundColor: AppColor.background,
      ),
      backgroundColor: AppColor.background,
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 25, 43, 55),
                        offset: Offset(0, 2),
                        blurRadius: 2,
                      )
                    ]),
                child: Column(
                  children: [
                    // Image - inverter
                    SizedBox(
                      height: 210,
                      child: Image.asset('assets/images/inverter_image.png'),
                    ),
                    // Data - rate & current efficiency, total ouput
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Rate efficency
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Rate efficiency',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColor.textPrimary,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          widget
                                              .inverterInfoModel.rateEfficiency
                                              .toStringAsFixed(2),
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: AppColor.greenDark,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '%',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: AppColor.textPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Current efficency
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 1),
                              decoration: BoxDecoration(
                                  // color: AppColor.orangeLight,
                                  border: Border.symmetric(
                                      vertical: BorderSide(
                                          color: AppColor.unfocus, width: 1))),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Current efficiency',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColor.textPrimary,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          widget.inverterInfoModel
                                              .currentEfficiency
                                              .toStringAsFixed(2),
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: AppColor.orangeLight,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '%',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: AppColor.textPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Total Output
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Total output',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColor.textPrimary,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          widget.inverterInfoModel.totalOutput
                                              .toStringAsFixed(1),
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: AppColor.error,
                                          ),
                                          textAlign: TextAlign.center,
                                          // maxFontSize: 18,
                                          // minFontSize: 15,
                                        ),
                                        Text(
                                          'kWh',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: AppColor.textPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                padding: EdgeInsets.all(8),
                child: Column(
                  spacing: 15,
                  children: [
                    // name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                            color: AppColor.textPrimary,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          widget.inverterInfoModel.nameInverter,
                          style: TextStyle(
                            color: AppColor.textPrimary,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    // serail number
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Serail number',
                          style: TextStyle(
                            color: AppColor.textPrimary,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          widget.inverterInfoModel.serialNumber,
                          style: TextStyle(
                            color: AppColor.textPrimary,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    // model
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Model',
                          style: TextStyle(
                            color: AppColor.textPrimary,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          widget.inverterInfoModel.model,
                          style: TextStyle(
                            color: AppColor.textPrimary,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    // maximum capacity
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Maximum capacity',
                          style: TextStyle(
                            color: AppColor.textPrimary,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${widget.inverterInfoModel.maxCapacity}W',
                          style: TextStyle(
                            color: AppColor.textPrimary,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    // installation date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Installation date',
                          style: TextStyle(
                            color: AppColor.textPrimary,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          DatetimeHelper.formatDateEng(
                              widget.inverterInfoModel.dateInstall),
                          style: TextStyle(
                            color: AppColor.textPrimary,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    // station
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Station',
                          style: TextStyle(
                            color: AppColor.textPrimary,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          widget.inverterInfoModel.stationName,
                          style: TextStyle(
                            color: AppColor.textPrimary,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    // status
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Status',
                          style: TextStyle(
                            color: AppColor.textPrimary,
                            fontSize: 16,
                          ),
                        ),
                        _widgetStatus(isOnline: widget.inverterInfoModel.status)
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

Widget _widgetStatus({required bool isOnline}) {
  return Row(
    children: [
      Row(
        children: [
          Text(
            'Offline',
            style: TextStyle(
              color: AppColor.textSecondary,
              fontSize: 15,
            ),
          ),
          SizedBox(width: 5),
          Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              color: isOnline ? AppColor.unfocus : AppColor.error,
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ],
      ),
      SizedBox(width: 10),
      Row(
        children: [
          Text(
            'Online',
            style: TextStyle(
              color: AppColor.textSecondary,
              fontSize: 15,
            ),
          ),
          SizedBox(width: 5),
          Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              color: isOnline ? AppColor.greenDark : AppColor.unfocus,
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ],
      ),
    ],
  );
}

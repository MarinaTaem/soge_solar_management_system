import 'package:flutter/material.dart';
import 'package:solar_management_system/model/station_inverter_total_model.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/utils/datetime_helper.dart';
import 'package:solar_management_system/widgets/card_history_inverters.dart';
import 'package:solar_management_system/widgets/card_summry_inverter.dart';

class DialyHistoryInverters extends StatefulWidget {
  final SmsaStationInverterDailyTotalModel? inverterDailyTotalModel;
  String nameStation;
  DialyHistoryInverters({
    super.key,
    required this.inverterDailyTotalModel,
    required this.nameStation,
  });

  @override
  State<DialyHistoryInverters> createState() => _DialyHistoryInvertersState();
}

class _DialyHistoryInvertersState extends State<DialyHistoryInverters> {
  List<SmsaStationInverterDailyModel> dailyRecords = [];
  List<SmsaStationInverterTotalModel> inverterTotals = [];

  @override
  void initState() {
    super.initState();
    fetchData();

    dailyRecords =
        widget.inverterDailyTotalModel?.smsaStationInverterDailyModelList ?? [];
    print('Daily record: ${dailyRecords.length}');
    inverterTotals =
        widget.inverterDailyTotalModel?.smsaStationInverterTotalModelList ?? [];
  }

  void fetchData() {}

  @override
  Widget build(BuildContext context) {
    // DateTime dateTime = DateTime.now();

    return Center(
      child: Column(
        children: [
          SizedBox(height: 10),
          // Summary all inverters in daily
          // CardSummryInverter(
          //   paramInverter: widget.paramInverter,
          //   dateTime: DatetimeHelper.formatToday(dateTime),
          //   inverterDailyTotalModel: widget.inverterDailyTotalModel,
          // ),
          CardSummryInverter(
            dateTime: DatetimeHelper.formatDay(
                widget.inverterDailyTotalModel!.dateTime!),
            nameStation: "Station 1",
            totalPvPower: widget.inverterDailyTotalModel!.totalPvEnergy,
            totalGridPower: widget.inverterDailyTotalModel!.totalGridEnergy,
            totalOutputPower: widget.inverterDailyTotalModel!.totalOutEnergy,
            pvVoltage: 0.0,
            pvCurrent: 0.0,
            gridVoltage: 0.0,
            outputVoltage: 0.0,
            outputCurrent: 0.0,
            outputFrequency: 0.0,
          ),
          SizedBox(height: 10),
          // total each inverter in daily
          if (inverterTotals.length != 1)
            SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(3),
                  itemCount: inverterTotals.length,
                  itemBuilder: (BuildContext context, int index) {
                    final inverter = inverterTotals[index];
                    return _tapContainerInverter(
                      nameInverter: "Inverter $index",
                      pv: inverter.totalPvEnergy!,
                      grid: inverter.totalGridEnergy!,
                      output: inverter.totalOutEnergy!,
                    );
                  }),
            ),
          SizedBox(height: 10),
          // display inverter history in dialy (each record in 5 min)
          Expanded(
              child: ListView.builder(
            itemCount: dailyRecords.length,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (BuildContext context, int index) {
              final inverter = dailyRecords[index];
              return CardHistoryInverters(
                nameInverter: 'Invert $index',
                dateTimeStr: DatetimeHelper.formatDayTime(inverter.dateTime!),
                pv_power: inverter.pvPower!,
                grid_power: inverter.gridPower!,
                out_power: inverter.outPower!,
                pv_v: inverter.pvVoltage!,
                pv_a: inverter.pvCurrent!,
                grid_a: inverter.outPower!,
                out_v: inverter.outVoltage!,
                out_a: inverter.outCurrent!,
                out_hz: inverter.outEnergy!,
              );
            },
          ))
        ],
      ),
    );
  }

  Widget _tapContainerInverter(
      {required String nameInverter,
      required double pv,
      required double grid,
      required double output}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColor.primary,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 37, 65, 83),
            offset: Offset(1, 0),
            spreadRadius: 1,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            nameInverter,
            style: TextStyle(
                color: AppColor.textPrimary,
                fontSize: 10,
                fontWeight: FontWeight.normal),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 3,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PV :',
                    style: TextStyle(color: AppColor.textPrimary, fontSize: 10),
                  ),
                  Text(
                    'Grid :',
                    style: TextStyle(color: AppColor.textPrimary, fontSize: 10),
                  ),
                  Text(
                    'Out :',
                    style: TextStyle(color: AppColor.textPrimary, fontSize: 10),
                  ),
                ],
              ),
              SizedBox(width: 5),
              // value
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 3,
                children: [
                  Row(
                    children: [
                      Text(
                        '${pv.toStringAsFixed(1)}',
                        style: TextStyle(
                            color: AppColor.textPrimary, fontSize: 10),
                      ),
                      Text(
                        ' kWh',
                        style: TextStyle(color: AppColor.unfocus, fontSize: 10),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${grid.toStringAsFixed(1)}',
                        style: TextStyle(
                            color: AppColor.textPrimary, fontSize: 10),
                      ),
                      Text(
                        ' kWh',
                        style: TextStyle(color: AppColor.unfocus, fontSize: 10),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${output.toStringAsFixed(1)}',
                        style: TextStyle(
                            color: AppColor.textPrimary, fontSize: 10),
                      ),
                      Text(
                        ' kWh',
                        style: TextStyle(color: AppColor.unfocus, fontSize: 10),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

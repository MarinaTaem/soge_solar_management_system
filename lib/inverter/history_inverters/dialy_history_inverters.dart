import 'package:flutter/material.dart';
import 'package:solar_management_system/model/inverter_model.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/utils/datetime_helper.dart';
import 'package:solar_management_system/widgets/card_history_inverters.dart';
import 'package:solar_management_system/widgets/card_summry_inverter.dart';

class DialyHistoryInverters extends StatefulWidget {
  final ParamInverter paramInverter;
  const DialyHistoryInverters({super.key, required this.paramInverter});

  @override
  State<DialyHistoryInverters> createState() => _DialyHistoryInvertersState();
}

class _DialyHistoryInvertersState extends State<DialyHistoryInverters> {
  List<ParamInverter> inverters = [];

  @override
  void initState() {
    super.initState();
    // inverters = [
    //   widget.paramInverter,
    //   widget.paramInverter,
    // ];
    inverters = [widget.paramInverter];
    print('Inverter lenge = ${inverters.length}');
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    return Center(
      child: Column(
        children: [
          SizedBox(height: 10),
          // Summary all inverters in daily
          CardSummryInverter(
            paramInverter: widget.paramInverter,
            dateTime: DatetimeHelper.formatToday(dateTime),
          ),
          SizedBox(height: 10),
          // total each inverter in daily
          if (inverters.length != 1)
            SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(3),
                  itemCount: inverters.length,
                  itemBuilder: (BuildContext context, int index) {
                    final inverter = inverters[index];
                    return _tapContainerInverter(
                      nameInverter: inverter.nameInverter,
                      pv: inverter.pvPower,
                      grid: inverter.gridPower,
                      output: inverter.outputPower,
                    );
                  }),
            ),
          SizedBox(height: 10),
          // display inverter history in dialy (each record is 5 min)
          Expanded(
              child: ListView.builder(
            itemCount: inverters.length,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (BuildContext context, int index) {
              final inverter = inverters[index];
              return CardHistoryInverters(
                nameInverter: 'Invert $index',
                dateTimeStr: DatetimeHelper.formatToday(dateTime),
                pv_power: inverter.pvPower,
                grid_power: inverter.outputPower,
                out_power: inverter.outputPower,
                pv_v: inverter.pvVoltage,
                pv_a: inverter.pvInputCurrent,
                grid_a: inverter.outputPower,
                out_v: inverter.outputVoltage,
                out_a: inverter.outputCurrent,
                out_hz: inverter.outputFrequency,
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

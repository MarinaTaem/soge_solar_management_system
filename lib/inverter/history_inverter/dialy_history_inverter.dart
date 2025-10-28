import 'package:flutter/material.dart';
import 'package:solar_management_system/model/inverter_model.dart';
import 'package:solar_management_system/utils/datetime_helper.dart';
import 'package:solar_management_system/widgets/card_history_inverter.dart';
import 'package:solar_management_system/widgets/card_summry_inverter.dart';

class DialyHistoryInverter extends StatefulWidget {
  final ParamInverter paramInverter;
  const DialyHistoryInverter({super.key, required this.paramInverter});

  @override
  State<DialyHistoryInverter> createState() => _DialyHistoryInverterState();
}

class _DialyHistoryInverterState extends State<DialyHistoryInverter> {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 10),
          // Summary all inverters
          // CardSummryInverter(
          //   paramInverter: widget.paramInverter,
          //   dateTime: DatetimeHelper.formatToday(date),
          // ),
          SizedBox(height: 10),
          // List all card history
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                CardHistoryInverter(
                  inverter: widget.paramInverter,
                  datetime: DatetimeHelper.formatDay(date),
                  time: "${date.hour}:${date.minute}",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

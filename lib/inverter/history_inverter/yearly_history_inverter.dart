import 'package:flutter/material.dart';
import 'package:solar_management_system/model/inverter_model.dart';
import 'package:solar_management_system/utils/datetime_helper.dart';
import 'package:solar_management_system/widgets/card_history_inverter.dart';
import 'package:solar_management_system/widgets/card_summry_inverter.dart';

class YearlyHistoryInverter extends StatefulWidget {
  final ParamInverter paramInverter;
  const YearlyHistoryInverter({super.key, required this.paramInverter});

  @override
  State<YearlyHistoryInverter> createState() => _YearlyHistoryInverterState();
}

class _YearlyHistoryInverterState extends State<YearlyHistoryInverter> {
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    return Center(
      child: Column(
        children: [
          SizedBox(height: 10),
          // Summary all inverters
          CardSummryInverter(
            paramInverter: widget.paramInverter,
            dateTime: DatetimeHelper.formatYear(dateTime),
          ),
          SizedBox(height: 10),

          // List all card history
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                CardHistoryInverter(
                  inverter: widget.paramInverter,
                  datetime: DatetimeHelper.formatYear(dateTime),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

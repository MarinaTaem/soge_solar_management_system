import 'package:flutter/material.dart';
import 'package:solar_management_system/widgets/card_history_inverter.dart';
import 'package:solar_management_system/widgets/card_summry_inverter.dart';

class DialyHistoryInverter extends StatefulWidget {
  const DialyHistoryInverter({super.key});

  @override
  State<DialyHistoryInverter> createState() => _DialyHistoryInverterState();
}

class _DialyHistoryInverterState extends State<DialyHistoryInverter> {
  @override
  Widget build(BuildContext context) {
    String nameInverter = 'វត្តលួង';
    String day = '12';
    String month = '03';
    String year = '2024';
    String time = "12:05";

    double pv_power = 1499.3;
    double grid_power = 679.1;
    double out_power = 399.6;
    double pv_v = 178.4;
    double pv_a = 67.4;
    double grid_a = 17.4;
    double out_v = 337.4;
    double out_a = 352.4;
    double out_hz = 1234.3;

    String sum_day = '12';
    String sum_month = '03';
    String sum_year = '2024';

    double sum_pv_power = 1499.3;
    double sum_grid_power = 679.1;
    double sum_out_power = 399.6;
    double sum_pv_v = 178.4;
    double sum_pv_a = 67.4;
    double sum_grid_a = 17.4;
    double sum_out_v = 337.4;
    double sum_out_a = 352.4;
    double sum_out_hz = 1234.3;
    return Center(
      child: Column(
        children: [
          SizedBox(height: 10),
          // Summary all inverters
          CardSummryInverter(
            nameStation: nameInverter,
            pv_power: sum_pv_power,
            pv_v: sum_pv_v,
            pv_a: sum_pv_a,
            grid_power: sum_grid_power,
            grid_a: sum_grid_a,
            out_power: sum_out_power,
            out_v: sum_out_v,
            out_a: sum_out_a,
            out_hz: sum_out_hz,
            isShowNameStation: false,
            isDialy: true,
            day: sum_day,
            month: sum_month,
            year: sum_year,
          ),
          SizedBox(height: 10),
          // List all card history
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                CardHistoryInverter(
                  nameInverter: nameInverter,
                  day: day,
                  month: month,
                  year: year,
                  time: time,
                  pv_power: pv_power,
                  grid_power: grid_power,
                  out_power: out_power,
                  pv_v: pv_v,
                  pv_a: pv_a,
                  grid_a: grid_a,
                  out_v: out_v,
                  out_a: out_a,
                  out_hz: out_hz,
                  isShowNameInverter: true,
                  isDialy: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/widgets/card_history_inverter.dart';
import 'package:solar_management_system/widgets/card_summry_inverter.dart';

class DialyHistoryInverters extends StatefulWidget {
  const DialyHistoryInverters({super.key});

  @override
  State<DialyHistoryInverters> createState() => _DialyHistoryInvertersState();
}

class _DialyHistoryInvertersState extends State<DialyHistoryInverters> {
  @override
  Widget build(BuildContext context) {
    String nameStation = 'វត្តលួង';
    String day = '12';
    String month = '03';
    String year = '2024';
    String time = "12:05";
    String nameInverter = "Inverter 1";

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
            nameStation: nameStation,
            pv_power: sum_pv_power,
            pv_v: sum_pv_v,
            pv_a: sum_pv_a,
            grid_power: sum_grid_power,
            grid_a: sum_grid_a,
            out_power: sum_out_power,
            out_v: sum_out_v,
            out_a: sum_out_a,
            out_hz: sum_out_hz,
            isShowNameStation: true,
            isDialy: true,
            day: sum_day,
            month: sum_month,
            year: sum_year,
          ),
          SizedBox(height: 10),
          Expanded(
            child: DefaultTabController(
              length: 5,
              child: Column(
                children: <Widget>[
                  ButtonsTabBar(
                    height: 80,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    backgroundColor: AppColor.primary,
                    unselectedBackgroundColor: AppColor.primary,
                    borderWidth: 2,
                    borderColor: AppColor.bluskyLight,
                    unselectedBorderColor: AppColor.unfocus,
                    labelStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    // unselectedLabelStyle: const TextStyle(
                    //     color: Colors.black87, fontWeight: FontWeight.bold),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    tabs: <Widget>[
                      Tab(child: _tapContainer()),
                      Tab(child: _tapContainerInverter()),
                      Tab(child: _tapContainerInverter()),
                      Tab(child: _tapContainerInverter()),
                      Tab(child: _tapContainerInverter()),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Center(
                          child: Column(
                            spacing: 5,
                            children: [
                              CardHistoryInverter(
                                day: day,
                                month: month,
                                year: year,
                                time: time,
                                nameInverter: nameInverter,
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
                        ),
                        Center(child: Text('Inverter 1')),
                        Center(child: Text('Inverter 2')),
                        Center(child: Text('Inverter 3')),
                        Center(child: Text('Inverter 3')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tapContainer() {
    return SizedBox(
      height: 80,
      width: 80,
      child: Center(
        child: Text(
          'ទាំងអស់',
          style: TextStyle(color: AppColor.textPrimary),
        ),
      ),
    );
  }

  Widget _tapContainerInverter() {
    return SizedBox(
      height: 90,
      width: 100,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Inverter',
              style: TextStyle(color: AppColor.textPrimary, fontSize: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'PV:',
                style: TextStyle(color: AppColor.textPrimary, fontSize: 10),
              ),
              Text('1212.2kW',
                  style: TextStyle(color: AppColor.textPrimary, fontSize: 10)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Grid:',
                  style: TextStyle(color: AppColor.textPrimary, fontSize: 10)),
              Text('121.2kW',
                  style: TextStyle(color: AppColor.textPrimary, fontSize: 10)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Out.:',
                  style: TextStyle(color: AppColor.textPrimary, fontSize: 10)),
              Text('121.2kW',
                  style: TextStyle(color: AppColor.textPrimary, fontSize: 10)),
            ],
          ),
        ],
      )),
    );
  }
}

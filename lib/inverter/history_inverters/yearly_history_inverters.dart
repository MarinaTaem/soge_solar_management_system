import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:solar_management_system/model/inverter_model.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/utils/datetime_helper.dart';
import 'package:solar_management_system/widgets/card_history_inverter.dart';
import 'package:solar_management_system/widgets/card_summry_inverter.dart';

class YearlyHistoryInverters extends StatefulWidget {
  ParamInverter paramInverter;
  YearlyHistoryInverters({super.key, required this.paramInverter});

  @override
  State<YearlyHistoryInverters> createState() => _YearlyHistoryInvertersState();
}

class _YearlyHistoryInvertersState extends State<YearlyHistoryInverters> {
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    return Center(
      child: Column(
        children: [
          SizedBox(height: 10),
          // CardSummryInverter(
          //   paramInverter: widget.paramInverter,
          //   dateTime: DatetimeHelper.formatYear(dateTime),
          // ),
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
                                inverter: widget.paramInverter,
                                datetime: DatetimeHelper.formatYear(dateTime),
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

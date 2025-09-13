import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solar_management_system/inverter/history_inverter/dialy_history_inverter.dart';
import 'package:solar_management_system/inverter/history_inverter/monthly_history_inverter.dart';
import 'package:solar_management_system/inverter/history_inverter/yearly_history_inverter.dart';
import 'package:solar_management_system/routes/app_route.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/widgets/custom_tap_bar.dart';

class InverterHistoryScreen extends StatefulWidget {
  const InverterHistoryScreen({super.key});

  @override
  State<InverterHistoryScreen> createState() => _InverterHistoryScreenState();
}

class _InverterHistoryScreenState extends State<InverterHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: AppColor.background,
          appBar: AppBar(
            backgroundColor: AppColor.background,
            leading: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.stationDetail);
                },
                icon: SvgPicture.asset(
                  'assets/images/arrow_back.svg',
                  colorFilter:
                      ColorFilter.mode(AppColor.textSecondary, BlendMode.srcIn),
                )),
            title: Text(
              'ប្រវត្តិអាំងវែកទ័រ',
              style: TextStyle(color: AppColor.textPrimary, fontSize: 18),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/images/chose_calendar.svg')),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/images/export.svg')),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(31),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 31,
                  decoration: BoxDecoration(
                    color: AppColor.textPrimary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(child: CustomTapBar()),
                ),
              ),
            ),
          ),
          body: TabBarView(children: [
            DialyHistoryInverter(),
            MonthlyHistoryInverter(),
            YearlyHistoryInverter(),
          ])),
    );
  }
}

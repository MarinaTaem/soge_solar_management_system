import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solar_management_system/inverter/history_inverters/dialy_history_inverters.dart';
import 'package:solar_management_system/inverter/history_inverters/monthly_history_inverters.dart';
import 'package:solar_management_system/inverter/history_inverters/yearly_history_inverters.dart';
import 'package:solar_management_system/model/inverter_model.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/widgets/custom_tap_bar.dart';
import 'package:solar_management_system/widgets/history_inverter_modal_botom.dart';

class InvertersHistoryScreen extends StatefulWidget {
  final ParamInverter paramInverter;
  InvertersHistoryScreen({super.key, required this.paramInverter});

  @override
  State<InvertersHistoryScreen> createState() => _InvertersHistoryScreenState();
}

class _InvertersHistoryScreenState extends State<InvertersHistoryScreen> {
  DateTime date = DateTime.now();
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
                  Navigator.pop(context);
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
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: AppColor.background,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        builder: (BuildContext contect) {
                          return HistoryInverterModalBotom(
                            date: date,
                            pv_v: 1.0,
                            pv_a: 2.0,
                            pv: 3.0,
                            grid_a: 4.0,
                            grid: 5.0,
                            output_v: 6.0,
                            output_a: 7.0,
                            output: 8.0,
                            output_hz: 9.0,
                          );
                        });
                  },
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
            DialyHistoryInverters(paramInverter: widget.paramInverter),
            MonthlyHistoryInverters(paramInverter: widget.paramInverter),
            YearlyHistoryInverters(paramInverter: widget.paramInverter),
          ])),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solar_management_system/model/inverter_model.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/style/app_text_style.dart';
import 'package:solar_management_system/utils/text_auto_size_helper.dart';

// ignore: must_be_immutable
class CardHistoryInverters extends StatefulWidget {
  final bool isShowNameInverter;
  final nameInverter;
  final double pv_power;
  final double pv_v;
  final double pv_a;
  final double grid_power;
  final double grid_a;
  final double out_power;
  final double out_v;
  final double out_a;
  final double out_hz;
  String? dateTimeStr;
  CardHistoryInverters({
    super.key,
    this.nameInverter = "",
    required this.pv_power,
    required this.pv_v,
    required this.pv_a,
    required this.grid_power,
    required this.grid_a,
    required this.out_power,
    required this.out_v,
    required this.out_a,
    required this.out_hz,
    this.isShowNameInverter = false,
    required this.dateTimeStr,
  });

  @override
  State<CardHistoryInverters> createState() => _CardHistoryInvertersState();
}

class _CardHistoryInvertersState extends State<CardHistoryInverters>
    with SingleTickerProviderStateMixin {
  bool isExtended = false;
  late AnimationController _controller;
  late Animation<double> _expandAnimation;
  List<Inverter> inverterCurrently = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => isExtended = !isExtended);
    if (isExtended) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 46, 72, 89),
              offset: const Offset(0, 3),
              blurRadius: 3,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 3,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('កាលបរិច្ឆេទៈ ', style: AppTextStyle.tittleCard),
                      Text(widget.dateTimeStr!, style: AppTextStyle.tittleCard),
                    ],
                  ),
                  SizedBox(
                    height: 17,
                    width: 17,
                    child: isExtended
                        ? SvgPicture.asset(
                            'assets/images/arrow_down.svg',
                            fit: BoxFit.contain,
                          )
                        : SvgPicture.asset(
                            'assets/images/arrow_up.svg',
                            fit: BoxFit.contain,
                          ),
                  ),
                ],
              ),
              if (widget.isShowNameInverter)
                Text('${widget.nameInverter}', style: AppTextStyle.tittleCard),
              const SizedBox(height: 4),
              // Summary row
              Row(
                children: [
                  // PV
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 2),
                                child: TextAutoSizeHelper(
                                  text: '${widget.pv_power}kWh',
                                  style: AppTextStyle.tittleCard,
                                  textAlign: TextAlign.center,
                                  maxFontSize: 15,
                                  minFontSize: 12,
                                ),
                              ),
                            ),
                            // Text(
                            //   'kWh',
                            //   style: TextStyle(
                            //     fontSize: 15,
                            //     color: AppColor.unfocus,
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(height: 5),
                        const Text(
                          'PV',
                          style: TextStyle(
                            color: AppColor.greenLight,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  // Grid
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 2),
                                child: TextAutoSizeHelper(
                                  text: '${widget.grid_power}kWh',
                                  style: AppTextStyle.tittleCard,
                                  maxFontSize: 15,
                                  minFontSize: 12,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            // Text(
                            //   'kWh',
                            //   style: TextStyle(
                            //     color: AppColor.unfocus,
                            //     fontSize: 15,
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(height: 5),
                        const Text(
                          'Grid',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColor.orangeLight,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  // Output
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 2),
                                child: TextAutoSizeHelper(
                                  text: '${widget.out_power}kWh',
                                  style: AppTextStyle.tittleCard,
                                  maxFontSize: 15,
                                  minFontSize: 12,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            // Text(
                            //   'kWh',
                            //   style: TextStyle(
                            //     fontSize: 15,
                            //     color: AppColor.unfocus,
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(height: 5),
                        const Text(
                          'Out',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColor.error,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Sliding expandable section
              // SizeTransition(
              //   sizeFactor: _expandAnimation,
              //   axisAlignment: -1.0,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 16),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         const Divider(thickness: 1),
              //         ListView.builder(
              //           shrinkWrap: true,
              //           physics: const NeverScrollableScrollPhysics(),
              //           itemCount: 4,
              //           itemBuilder: (BuildContext context, int index) {
              //             return _widgetCardEachInverter(
              //                 nameInverter: 'Inverter $index',
              //                 pv: widget.pv_power,
              //                 grid: widget.grid_power,
              //                 output: widget.out_power);
              //           },
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _widgetCardEachInverter(
    {required String nameInverter,
    required double pv,
    required double grid,
    required double output}) {
  return Container(
    padding: EdgeInsets.all(6),
    margin: EdgeInsets.only(top: 5),
    decoration: BoxDecoration(
      color: AppColor.textSecondary,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              nameInverter,
              style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 15,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
        ),
        SizedBox(height: 5),
        Row(
          spacing: 5,
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 22,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '$pv',
                            style: AppTextStyle.bodyPrimaryBlue,
                          ),
                          Text(
                            'kW',
                            style: TextStyle(
                                fontSize: 15, color: AppColor.unfocus),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'PV',
                    style: TextStyle(
                      color: AppColor.greenLight,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 22,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '$grid',
                            style: AppTextStyle.bodyPrimaryBlue,
                          ),
                          Text(
                            'kW',
                            style: TextStyle(
                              color: AppColor.unfocus,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Grid',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColor.orangeLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 22,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '$output',
                            style: AppTextStyle.bodyPrimaryBlue,
                          ),
                          Text(
                            'kW',
                            style: TextStyle(
                                fontSize: 15, color: AppColor.unfocus),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Out',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColor.error,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

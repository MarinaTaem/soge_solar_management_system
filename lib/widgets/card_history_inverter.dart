import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solar_management_system/model/inverter_model.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/style/app_text_style.dart';

class CardHistoryInverter extends StatefulWidget {
  final ParamInverter inverter;
  final String datetime;
  final String time;
  const CardHistoryInverter({
    super.key,
    required this.inverter,
    required this.datetime,
    this.time = "",
  });

  @override
  State<CardHistoryInverter> createState() => _CardHistoryInverterState();
}

class _CardHistoryInverterState extends State<CardHistoryInverter>
    with SingleTickerProviderStateMixin {
  bool isExtended = false;
  late AnimationController _controller;
  late Animation<double> _expandAnimation;

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
        margin: const EdgeInsets.symmetric(vertical: 8),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'កាលបរិច្ឆេទៈ ',
                      style: AppTextStyle.tittleCard,
                    ),
                    Text(
                      widget.datetime,
                      style: AppTextStyle.tittleCard,
                    ),
                    Text(
                      "  ${widget.time}",
                      style: AppTextStyle.tittleCard,
                    ),
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
            const SizedBox(height: 4),
            // Summary row
            Row(
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
                                '${widget.inverter.pvPower}',
                                style: AppTextStyle.tittleCard,
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
                                '${widget.inverter.gridPower}',
                                style: AppTextStyle.tittleCard,
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
                                '${widget.inverter.outputPower}',
                                style: AppTextStyle.tittleCard,
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
            // Sliding expandable section
            SizeTransition(
              sizeFactor: _expandAnimation,
              axisAlignment: -1.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Divider(thickness: 1),
                    // Param : pv, grid, out
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 3),
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    'PV: ${widget.inverter.pvVoltage}V',
                                    style: AppTextStyle.body,
                                  ),
                                ),
                              ),
                              Text(
                                'PV: ${widget.inverter.pvInputCurrent}A',
                                style: AppTextStyle.body,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 1.5),
                                child: Text(
                                  'Grid: ${"widget.grid_a"}A',
                                  style: AppTextStyle.body,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 3),
                                child: Text(
                                  'Out: ${widget.inverter.outputVoltage}V',
                                  style: AppTextStyle.body,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(),
                                child: Text(
                                  'Out: ${widget.inverter.outputCurrent}A',
                                  style: AppTextStyle.body,
                                ),
                              ),
                              Text(
                                'Out: ${widget.inverter.outputFrequency}Hz',
                                style: AppTextStyle.body,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

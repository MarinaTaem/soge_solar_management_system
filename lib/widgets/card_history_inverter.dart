import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/style/app_text_style.dart';

class CardHistoryInverter extends StatefulWidget {
  final bool isShowNameInverter;
  final String day;
  final String month;
  final String year;
  final String time;
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
  final bool isDialy;
  final bool isMonthly;
  final bool isYarly;
  CardHistoryInverter({
    super.key,
    this.nameInverter,
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
    this.isDialy = false,
    this.isMonthly = false,
    this.isYarly = false,
    this.time = '',
    this.day = '',
    this.month = '',
    this.year = '',
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
                if (widget.isDialy)
                  Row(
                    children: [
                      Text(
                        'កាលបរិច្ឆេទៈ ',
                        style: AppTextStyle.tittleCard,
                      ),
                      Text(
                        "${widget.day}-",
                        style: AppTextStyle.tittleCard,
                      ),
                      Text(
                        "${widget.month}-",
                        style: AppTextStyle.tittleCard,
                      ),
                      Text(
                        widget.year,
                        style: AppTextStyle.tittleCard,
                      ),
                      SizedBox(width: 10),
                      Text(
                        widget.time,
                        style: AppTextStyle.tittleCard,
                      ),
                    ],
                  ),
                if (widget.isMonthly)
                  Row(
                    children: [
                      Text(
                        'កាលបរិច្ឆេទៈ ',
                        style: AppTextStyle.tittleCard,
                      ),
                      Text(
                        "${widget.day}-",
                        style: AppTextStyle.tittleCard,
                      ),
                      Text(
                        "${widget.month}-",
                        style: AppTextStyle.tittleCard,
                      ),
                      Text(
                        widget.year,
                        style: AppTextStyle.tittleCard,
                      ),
                    ],
                  ),
                if (widget.isYarly)
                  Row(
                    children: [
                      Text(
                        'កាលបរិច្ឆេទៈ ',
                        style: AppTextStyle.tittleCard,
                      ),
                      Text(
                        "${widget.month}-",
                        style: AppTextStyle.tittleCard,
                      ),
                      Text(
                        widget.year,
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
            if (widget.isShowNameInverter)
              Text(
                '${widget.nameInverter}',
                style: AppTextStyle.tittleCard,
              ),
            const SizedBox(height: 4),
            // Summary row
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${widget.pv_power}',
                            style: AppTextStyle.tittleCard,
                          ),
                          Text(
                            'kW',
                            style: TextStyle(
                                fontSize: 15, color: AppColor.unfocus),
                          ),
                        ],
                      ),
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
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${widget.grid_power}',
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
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${widget.out_power}',
                            style: AppTextStyle.tittleCard,
                          ),
                          Text(
                            'kW',
                            style: TextStyle(
                                fontSize: 15, color: AppColor.unfocus),
                          ),
                        ],
                      ),
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
                              Text(
                                'PV: ${widget.pv_v}V',
                                style: AppTextStyle.body,
                              ),
                              Text(
                                'PV: ${widget.pv_a}A',
                                style: AppTextStyle.body,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Grid: ${widget.grid_a}A',
                                style: AppTextStyle.body,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Out: ${widget.out_v}V',
                                style: AppTextStyle.body,
                              ),
                              Text(
                                'Out: ${widget.out_a}A',
                                style: AppTextStyle.body,
                              ),
                              Text(
                                'Out: ${widget.out_hz}Hz',
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

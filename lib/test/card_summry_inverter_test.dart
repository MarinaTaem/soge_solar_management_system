import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/utils/datetime_helper.dart';
import 'package:solar_management_system/utils/text_auto_size_helper.dart';

class CardSummryInverterTest extends StatefulWidget {
  // final SmsaStationInverterDailyTotalModel inverterDailyTotalModel;
  final DateTime? dateTime;
  final String nameStation;
  final double? totalPvPower;
  final double? totalGridPower;
  final double? totalOutputPower;
  final double pvVoltage;
  final double pvCurrent;
  final double gridVoltage;
  final double outputVoltage;
  final double outputCurrent;
  final double outputFrequency;
  const CardSummryInverterTest({
    super.key,
    required this.dateTime,
    required this.nameStation,
    required this.totalPvPower,
    required this.totalGridPower,
    required this.totalOutputPower,
    required this.pvVoltage,
    required this.pvCurrent,
    required this.gridVoltage,
    required this.outputVoltage,
    required this.outputCurrent,
    required this.outputFrequency,
  });

  @override
  State<CardSummryInverterTest> createState() => _CardSummryInverterTestState();
}

class _CardSummryInverterTestState extends State<CardSummryInverterTest>
    with TickerProviderStateMixin {
  bool isExtended = false;
  late Animation<double> _expendable;
  late AnimationController _controller;
  // DateTime dateTime;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _expendable = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
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
        width: MediaQuery.of(context).size.width - 32,
        decoration: const BoxDecoration(
          color: AppColor.textPrimary,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Text(
                  'ទិន្នន័យសរុប',
                  style: TextStyle(color: AppColor.primary, fontSize: 15),
                ),
                SizedBox(height: 10),
                // Sammary pv, grid, out
                // ',' = 10 + .0, 11
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  spacing: 3,
                  children: [
                    // pv
                    Expanded(
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 5,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/pv.svg',
                                  height: 25,
                                  width: 25,
                                  colorFilter: ColorFilter.mode(
                                      AppColor.bluskyLight, BlendMode.srcIn),
                                ),
                                SizedBox(width: 5),
                                Text('PV',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColor.greenDark,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 1),
                              child: TextAutoSizeHelper(
                                text: '${widget.totalPvPower}kWh',
                                style: TextStyle(
                                    color: AppColor.primary,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                maxFontSize: 20,
                                minFontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // grid
                    Expanded(
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 3,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/grid.svg',
                                  height: 25,
                                  width: 25,
                                  colorFilter: ColorFilter.mode(
                                      AppColor.bluskyLight, BlendMode.srcIn),
                                ),
                                SizedBox(width: 5),
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
                            Container(
                              padding: EdgeInsets.all(1),
                              child: TextAutoSizeHelper(
                                text: '${widget.totalGridPower}kWh',
                                style: TextStyle(
                                    color: AppColor.primary,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                maxFontSize: 20,
                                minFontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Output
                    Expanded(
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 3,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/energy.svg',
                                  height: 25,
                                  width: 25,
                                  colorFilter: ColorFilter.mode(
                                      AppColor.bluskyLight, BlendMode.srcIn),
                                ),
                                SizedBox(width: 5),
                                Text('Out',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColor.error,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(1),
                              child: TextAutoSizeHelper(
                                text: '${widget.totalOutputPower}kWh',
                                style: TextStyle(
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                                maxFontSize: 20,
                                minFontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // date & station
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'កាលបរិច្ឆេទ: ${DatetimeHelper.formatDay(widget.dateTime!)}',
                      style: TextStyle(color: AppColor.primary, fontSize: 12),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        height: 18,
                        padding: EdgeInsets.all(2),
                        alignment: Alignment.centerRight,
                        child: TextAutoSizeHelper(
                          text: 'ស្ថានីយ៍​${widget.nameStation}',
                          style: TextStyle(color: AppColor.primary),
                          maxFontSize: 12,
                          minFontSize: 10,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ],
                ),
                // Buttom
                SizeTransition(
                  sizeFactor: _expendable,
                  axis: Axis.vertical,
                  axisAlignment: -1.0,
                  child: Container(
                      // height: isExtended ? 67 : 0,
                      color: AppColor.textPrimary,
                      child: Center(
                          child: Column(
                        children: [
                          Divider(thickness: 1),
                          // Paramets
                          // 10 cha, + .0
                          // 12 cha
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              spacing: 5,
                              children: [
                                // pv
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(1),
                                        child: TextAutoSizeHelper(
                                          text: 'PV: ${widget.pvVoltage}V',
                                          style: TextStyle(
                                              color: AppColor.primary,
                                              fontSize: 12),
                                          maxFontSize: 12,
                                          minFontSize: 10,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(1),
                                        child: TextAutoSizeHelper(
                                          text: 'PV: ${widget.pvCurrent}A',
                                          style: TextStyle(
                                              color: AppColor.primary,
                                              fontSize: 12),
                                          maxFontSize: 12,
                                          minFontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // grid
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(1),
                                        child: TextAutoSizeHelper(
                                          text: 'Grid: ${widget.gridVoltage}V',
                                          style: TextStyle(
                                            color: AppColor.primary,
                                          ),
                                          maxFontSize: 12,
                                          minFontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // output
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(1),
                                        child: TextAutoSizeHelper(
                                          text:
                                              'Out.: ${widget.outputVoltage}V',
                                          style: TextStyle(
                                              color: AppColor.primary),
                                          maxFontSize: 12,
                                          minFontSize: 10,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(1),
                                        child: TextAutoSizeHelper(
                                          text: 'Out: ${widget.outputCurrent}A',
                                          style: TextStyle(
                                              color: AppColor.primary),
                                          maxFontSize: 12,
                                          minFontSize: 10,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(1),
                                        child: TextAutoSizeHelper(
                                          text:
                                              'Out: ${widget.outputFrequency}Hz',
                                          style: TextStyle(
                                              color: AppColor.primary),
                                          maxFontSize: 12,
                                          minFontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

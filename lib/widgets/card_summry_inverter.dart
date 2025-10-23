import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solar_management_system/model/inverter_model.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/utils/text_auto_size_helper.dart';

class CardSummryInverter extends StatefulWidget {
  final ParamInverter paramInverter;
  String dateTime;
  CardSummryInverter({
    super.key,
    required this.paramInverter,
    required this.dateTime,
  });

  @override
  State<CardSummryInverter> createState() => _CardSummryInverterState();
}

class _CardSummryInverterState extends State<CardSummryInverter>
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
                            // ',' = 10, 11
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 1),
                              child: TextAutoSizeHelper(
                                text: '1,000,000,000.0kWh',
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
                                Text('Grid',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColor.orangeLight,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(1),
                              child: TextAutoSizeHelper(
                                text: '1,000,000,000.0kWh',
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
                                text: '1,234,567,890.0kWh',
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
                      'កាលបរិច្ឆេទ: ${widget.dateTime}',
                      style: TextStyle(color: AppColor.primary, fontSize: 12),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        height: 18,
                        padding: EdgeInsets.all(2),
                        alignment: Alignment.centerRight,
                        child: TextAutoSizeHelper(
                          text: 'ស្ថានីយ៍​${widget.paramInverter.nameStation}',
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
                // ',': 12
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
                                          text:
                                              'PV: ${widget.paramInverter.pvVoltage}V',
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
                                          text:
                                              'PV: ${widget.paramInverter.pvInputCurrent}A',
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
                                          text: 'Grid: 934,234,567,890C',
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
                                              'Out.: ${widget.paramInverter.outputVoltage}V',
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
                                              'Out: ${widget.paramInverter.outputCurrent}A',
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
                                              'Out: ${widget.paramInverter.outputFrequency}Hz',
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

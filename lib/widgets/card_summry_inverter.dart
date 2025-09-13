import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solar_management_system/style/app_colors.dart';

class CardSummryInverter extends StatefulWidget {
  // char = 12 + 2
  final double pv_power;
  final double grid_power;
  final double out_power;
  // char = 7 + 2
  final double pv_v;
  final double pv_a;
  final double grid_a;
  final double out_v;
  final double out_a;
  final double out_hz;
  final String nameStation;
  final String day;
  final String month;
  final String year;
  final bool isShowNameStation;
  final bool isDialy;
  final bool isMonthly;
  final bool isYearly;
  const CardSummryInverter({
    super.key,
    required this.pv_power,
    required this.pv_v,
    required this.pv_a,
    required this.grid_power,
    required this.grid_a,
    required this.out_power,
    required this.out_v,
    required this.out_a,
    required this.out_hz,
    this.nameStation = '',
    this.day = '',
    this.month = '',
    this.year = '',
    this.isShowNameStation = true,
    this.isDialy = false,
    this.isMonthly = false,
    this.isYearly = false,
  });

  @override
  State<CardSummryInverter> createState() => _CardSummryInverterState();
}

class _CardSummryInverterState extends State<CardSummryInverter>
    with TickerProviderStateMixin {
  bool isExtended = false;
  late Animation<double> _expendable;
  late AnimationController _controller;

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // pv
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                                  color: AppColor.greenDark,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        Text(
                          '${widget.pv_power}kW',
                          style: TextStyle(
                              color: AppColor.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        )
                      ],
                    ),
                    // grid
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                                  color: AppColor.orangeLight,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        Text(
                          '${widget.grid_power}kWh',
                          style: TextStyle(
                              color: AppColor.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        )
                      ],
                    ),
                    // Output
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                                  color: AppColor.error,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        Text(
                          '${widget.out_power}kW',
                          style: TextStyle(
                              color: AppColor.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // date & station
                if (widget.isDialy)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'កាលបរិច្ឆេទ: ',
                            style: TextStyle(
                                color: AppColor.primary, fontSize: 12),
                          ),
                          Text(
                            '${widget.day}-',
                            style: TextStyle(
                                color: AppColor.primary, fontSize: 12),
                          ),
                          Text(
                            '${widget.month}-',
                            style: TextStyle(
                                color: AppColor.primary, fontSize: 12),
                          ),
                          Text(
                            widget.year,
                            style: TextStyle(
                                color: AppColor.primary, fontSize: 12),
                          ),
                        ],
                      ),
                      Text(
                        'ស្ថានីយ៍​${widget.nameStation}',
                        style: TextStyle(color: AppColor.primary, fontSize: 12),
                      ),
                    ],
                  ),
                if (widget.isMonthly)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'កាលបរិច្ឆេទ: ',
                            style: TextStyle(
                                color: AppColor.primary, fontSize: 12),
                          ),
                          Text(
                            '${widget.month}-',
                            style: TextStyle(
                                color: AppColor.primary, fontSize: 12),
                          ),
                          Text(
                            widget.year,
                            style: TextStyle(
                                color: AppColor.primary, fontSize: 12),
                          ),
                        ],
                      ),
                      Text(
                        'ស្ថានីយ៍​${widget.nameStation}',
                        style: TextStyle(color: AppColor.primary, fontSize: 12),
                      ),
                    ],
                  ),
                if (widget.isYearly)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'កាលបរិច្ឆេទ: ',
                            style: TextStyle(
                                color: AppColor.primary, fontSize: 12),
                          ),
                          Text(
                            widget.year,
                            style: TextStyle(
                                color: AppColor.primary, fontSize: 12),
                          ),
                        ],
                      ),
                      Text(
                        'ស្ថានីយ៍​${widget.nameStation}',
                        style: TextStyle(color: AppColor.primary, fontSize: 12),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                // pv
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'PV: ${widget.pv_v}V',
                                        style: TextStyle(
                                            color: AppColor.primary,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        'PV: ${widget.pv_a}A',
                                        style: TextStyle(
                                            color: AppColor.primary,
                                            fontSize: 12),
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
                                      Text(
                                        'Grid: ${widget.grid_a}A',
                                        style: TextStyle(
                                            color: AppColor.primary,
                                            fontSize: 12),
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
                                      Text(
                                        'Out.: ${widget.out_v}V',
                                        style: TextStyle(
                                            color: AppColor.primary,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        'Grid: ${widget.out_a}A',
                                        style: TextStyle(
                                            color: AppColor.primary,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        'Grid: ${widget.out_hz}Hz',
                                        style: TextStyle(
                                            color: AppColor.primary,
                                            fontSize: 12),
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

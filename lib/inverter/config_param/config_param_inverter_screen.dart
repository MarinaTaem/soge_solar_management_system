import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:solar_management_system/model/inverter_model.dart';
import 'package:solar_management_system/station_detail_screen.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/style/app_text_style.dart';
import 'package:solar_management_system/widgets/card_config_param_inverter.dart';
import 'package:solar_management_system/widgets/dialog_clearify_config_param.dart';
import 'package:solar_management_system/widgets/snackbar_config_param.dart';
import 'package:solar_management_system/widgets/toas_message_warning.dart';
import 'package:solar_management_system/widgets/widget_dropdown.dart';
import 'package:solar_management_system/widgets/widget_input.dart';

class ConfigParamInverterScreen extends StatefulWidget {
  final ParamInverter paramInverter;
  final bool isInverterOpen;
  const ConfigParamInverterScreen(
      {super.key, required this.paramInverter, required this.isInverterOpen});

  @override
  State<ConfigParamInverterScreen> createState() =>
      _ConfigParamInverterScreenState();
}

class _ConfigParamInverterScreenState extends State<ConfigParamInverterScreen>
    with TickerProviderStateMixin {
  bool isExpended = false;
  late Animation<double> _expendable;
  late AnimationController _controller;

  bool isSaveChange = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _expendable = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // show top snackbar
    if (widget.paramInverter.status == false) {
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          messageWarning(context);
        }
      });
    }
  }

  @override
  void dispose() {
    _controller;
    super.dispose();
  }

  void toggle() {
    setState(() => isExpended = !isExpended);
    if (isExpended) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.background,
        shadowColor: AppColor.black,
        elevation: 4,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              if (isSaveChange == false) {
                setState(() {
                  clarifyDialog(context, status: widget.paramInverter.status);
                });
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StationDetailScreen()));
              }
            },
            icon: SvgPicture.asset(
              'assets/images/arrow_back.svg',
              colorFilter:
                  ColorFilter.mode(AppColor.textPrimary, BlendMode.srcIn),
            )),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.paramInverter.status
                    ? AppColor.greenDark
                    : AppColor.error,
              ),
            ),
            Text(
              'កំណត់អាំងវែកទ័រ',
              style: TextStyle(fontSize: 18, color: AppColor.textPrimary),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () async {
              setState(() {
                isSaveChange = true;
              });
              // Show loading
              context.loaderOverlay.show();
              await Future.delayed(const Duration(seconds: 2));
              context.loaderOverlay.hide();
              // Show snackbar
              final snackBar =
                  snackbar(context, isConnected: widget.paramInverter.status);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              // back to station detail - inverter
              Navigator.pop(context);
            },
            child: Text(
              'រក្សាទុក',
              style: TextStyle(fontSize: 15, color: AppColor.bluskyLight),
            ),
          ),
        ],
      ),
      backgroundColor: AppColor.background,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ការត្រួតពិនិត្យប៉ារ៉ាម៉ែត
              CardConfigParamInverter(
                title: 'ការត្រួតពិនិត្យប៉ារ៉ាម៉ត្រ',
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name param
                    Expanded(
                      flex: 3,
                      child: Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(''), // blank
                          Text(
                            'Output frequency',
                            style: AppTextStyle.tittleCard,
                          ),
                          Text(
                            'Preset frequency',
                            style: AppTextStyle.tittleCard,
                          ),
                          Text(
                            'PV voltage',
                            style: AppTextStyle.tittleCard,
                          ),
                          Text(
                            'Output voltage',
                            style: AppTextStyle.tittleCard,
                          ),
                          Text(
                            'Output current',
                            style: AppTextStyle.tittleCard,
                          ),
                          Text(
                            'Output power',
                            style: AppTextStyle.tittleCard,
                          ),
                          Text(
                            'PV input current',
                            style: AppTextStyle.tittleCard,
                          ),
                        ],
                      ),
                    ),
                    // Value
                    Expanded(
                      flex: 4,
                      child: Column(
                        spacing: 5,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Title
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  'In',
                                  style: AppTextStyle.tittleCard,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Output',
                                  style: AppTextStyle.tittleCard,
                                ),
                              ),
                            ],
                          ),
                          // Value
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: widgetBlank(),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      widget.paramInverter.output_frequency
                                          .toStringAsFixed(1),
                                      style: AppTextStyle.inActiveTitle,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Hz',
                                      style: AppTextStyle.unfocusTitle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      widget.paramInverter.preset_frequency
                                          .toStringAsFixed(1),
                                      style: AppTextStyle.inActiveTitle,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Hz',
                                      style: AppTextStyle.unfocusTitle,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(child: widgetBlank()),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      widget.paramInverter.pv_voltage
                                          .toStringAsFixed(1),
                                      style: AppTextStyle.inActiveTitle,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'V',
                                      style: AppTextStyle.unfocusTitle,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(child: widgetBlank()),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: widgetBlank(),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      widget.paramInverter.output_voltage
                                          .toStringAsFixed(1),
                                      style: AppTextStyle.inActiveTitle,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'V',
                                      style: AppTextStyle.unfocusTitle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: widgetBlank(),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      widget.paramInverter.output_current
                                          .toStringAsFixed(1),
                                      style: AppTextStyle.inActiveTitle,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'A',
                                      style: AppTextStyle.unfocusTitle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: widgetBlank(),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      widget.paramInverter.output_power
                                          .toStringAsFixed(1),
                                      style: AppTextStyle.inActiveTitle,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'kW',
                                      style: AppTextStyle.unfocusTitle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: widgetBlank(),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      widget.paramInverter.pv_input_current
                                          .toStringAsFixed(1),
                                      style: AppTextStyle.inActiveTitle,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'A',
                                      style: AppTextStyle.unfocusTitle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // ប៉ារ៉ាម៉ែតទូទៅ (ប៉ារ៉ាម៉ែតអនុគមន៍មូលដ្ឋាន)
              CardConfigParamInverter(
                title: 'ប៉ារ៉ាម៉ែតទូទៅ (ប៉ារ៉ាម៉ែតអនុគមន៍មូលដ្ឋាន)',
                content: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name param
                    Expanded(
                        flex: 3,
                        child: Column(
                          spacing: 5,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'P0_00',
                              style: AppTextStyle.tittleCard,
                            ),
                            Text(
                              'P0_01',
                              style: AppTextStyle.tittleCard,
                            ),
                            Text(
                              'P0_02',
                              style: AppTextStyle.tittleCard,
                            ),
                            Text(
                              'P0_08',
                              style: AppTextStyle.tittleCard,
                            ),
                            Text(
                              'P0_09',
                              style: AppTextStyle.tittleCard,
                            ),
                            Text(
                              'P0_10',
                              style: AppTextStyle.tittleCard,
                            ),
                          ],
                        )),
                    // Value param
                    Expanded(
                        flex: 4,
                        child: Column(
                          spacing: 5,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // P0_00
                            Row(
                              children: [
                                Expanded(
                                    child: WidgetDropdown(
                                        value: widget.paramInverter.p0_00.value
                                            .toString(),
                                        options: {
                                          "${P0_00.gType.value}":
                                              "1: ${P0_00.gType.description}",
                                          "${P0_00.pType.value}":
                                              "2: ${P0_00.pType.description}",
                                        },
                                        description: 'ការបង្ហាញម៉ូដែល GP',
                                        range: '1: ម៉ូដែល G, 2: ម៉ូដែល P',
                                        isEditable: true)),
                                SizedBox(width: 5),
                                SizedBox(width: 30, child: Text(''))
                              ],
                            ),
                            // P0_01
                            Row(
                              children: [
                                Expanded(
                                    child: WidgetDropdown(
                                  value: widget.paramInverter.p0_01.value
                                      .toString(),
                                  options: {
                                    "${P0_01.vfControl.value}":
                                        "0: ${P0_01.vfControl.description}",
                                    "${P0_01.sensorless.value}":
                                        "1: ${P0_01.sensorless.description}",
                                    "${P0_01.sensor.value}":
                                        "2: ${P0_01.sensor.description}",
                                    "${P0_01.twoWires.value}":
                                        "3: ${P0_01.twoWires.description}",
                                    "${P0_01.threeWires.value}":
                                        "4: ${P0_01.threeWires.description}",
                                  },
                                  description: 'ជ្រើរើសប្រភទម៉ូទ័រ',
                                  range:
                                      '0: VF, 1: Sensorless, 2: Sensor, 3: 2 wire output, 4: 3 wire output',
                                  isEditable:
                                      widget.isInverterOpen ? true : false,
                                )),
                                SizedBox(width: 5),
                                SizedBox(width: 30, child: Text(''))
                              ],
                            ),
                            // P0_02
                            Row(
                              children: [
                                Expanded(
                                    child: WidgetDropdown(
                                  value: widget.paramInverter.p0_02.value
                                      .toString(),
                                  options: {
                                    "${P0_02.keypad.value}":
                                        "0: ${P0_02.keypad.description}",
                                    "${P0_02.terminalCmd.value}":
                                        "1: ${P0_02.terminalCmd.description}",
                                    "${P0_02.rs485.value}":
                                        "2: ${P0_02.rs485.description}",
                                  },
                                  description:
                                      'ជ្រើសរើសវិធីដើម្បីបើក/បិទអាំងវែកទ័រ',
                                  range:
                                      '1: ប្រើប្រាស់ Keypad, 2: ប្រើប្រាស់ Terminal Command, 3: ប្រើប្រាស់ RS485,',
                                  isEditable: true,
                                )),
                                SizedBox(width: 5),
                                SizedBox(width: 30, child: Text(''))
                              ],
                            ),
                            // P0_08
                            Row(
                              children: [
                                Expanded(
                                    child: WidgetInput(
                                  value: '${widget.paramInverter.p0_08}',
                                  description: 'ការកំណត់ប្រេកង់ជាមុននៃម៉ូទ័រ',
                                  range: '0Hz -> តម្លៃអតិបរមា (PE10)',
                                  isEditable: true,
                                )),
                                SizedBox(width: 5),
                                SizedBox(
                                    width: 30,
                                    child: Text(
                                      'Hz',
                                      style: AppTextStyle.inActiveTitle,
                                    ))
                              ],
                            ),
                            // P0_09
                            Row(
                              children: [
                                Expanded(
                                    child: WidgetDropdown(
                                  value: widget.paramInverter.p0_09.value
                                      .toString(),
                                  options: {
                                    "${P0_09.motorForward.value}":
                                        "0: ${P0_09.motorForward.description}",
                                    "${P0_09.motorReverse.value}":
                                        "1: ${P0_09.motorForward.description}",
                                  },
                                  description: 'ជ្រើសរើសទិសដៅនៃម៉ូទ័រ',
                                  range: '0: ម៉ូទ័រទៅមុខ, 1: ម៉ូទ័របញ្ច្រាស់',
                                  isEditable: true,
                                )),
                                SizedBox(width: 5),
                                SizedBox(width: 30, child: Text(''))
                              ],
                            ),
                            // P0_10
                            Row(
                              children: [
                                Expanded(
                                    child: WidgetInput(
                                  value: '${widget.paramInverter.p0_10}',
                                  description: 'ប្រេកង់អតិរមា',
                                  range: '50.0Hz -> 600.0Hz',
                                  isEditable:
                                      widget.isInverterOpen ? true : false,
                                )),
                                SizedBox(width: 5),
                                SizedBox(
                                    width: 30,
                                    child: Text(
                                      'Hz',
                                      style: AppTextStyle.inActiveTitle,
                                    ))
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              // ប៉ារ៉ាម៉ែតទូទៅ (ប៉ារ៉ាម៉ែតរបស់ម៉ូទ័រទី១)
              CardConfigParamInverter(
                  content: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name param
                      Expanded(
                          flex: 3,
                          child: Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'P1_01',
                                style: AppTextStyle.tittleCard,
                              ),
                              Text(
                                'P1_02',
                                style: AppTextStyle.tittleCard,
                              ),
                              Text(
                                'P1_03',
                                style: AppTextStyle.tittleCard,
                              ),
                              Text(
                                'P1_04',
                                style: AppTextStyle.tittleCard,
                              ),
                              Text(
                                'P1_05',
                                style: AppTextStyle.tittleCard,
                              ),
                            ],
                          )),
                      // Value param
                      Expanded(
                          flex: 4,
                          child: Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // P1_01
                              Row(
                                children: [
                                  Expanded(
                                      child: WidgetInput(
                                    value: '${widget.paramInverter.p1_01}',
                                    description: 'ការវាយតម្លៃថាមពលនៃម៉ូទ័រ',
                                    range: '0.1KW -> 1000.0KW',
                                    isEditable: true,
                                  )),
                                  SizedBox(width: 5),
                                  SizedBox(
                                      width: 30,
                                      child: Text(
                                        'kW',
                                        style: AppTextStyle.inActiveTitle,
                                      ))
                                ],
                              ),
                              // P1_02
                              Row(
                                children: [
                                  Expanded(
                                      child: WidgetInput(
                                    value: '${widget.paramInverter.p1_02}',
                                    description: 'ការវាយតម្លៃវ៉ុលនៃម៉ូទ័រ',
                                    range: '1V -> 2000V',
                                    isEditable: true,
                                  )),
                                  SizedBox(width: 5),
                                  SizedBox(
                                      width: 30,
                                      child: Text(
                                        'V',
                                        style: AppTextStyle.inActiveTitle,
                                      ))
                                ],
                              ),
                              // P1_03
                              Row(
                                children: [
                                  Expanded(
                                      child: WidgetInput(
                                          value:
                                              '${widget.paramInverter.p1_03}',
                                          description:
                                              'ការវាយតម្លៃចរន្តនៃម៉ូទ័រ',
                                          range:
                                              'ថាមពល Inverter < 55KW: 0.01A -> 655.35A, ថាមពល Inverter > 55KW: 0.1A -> 6553.5A',
                                          isEditable: true)),
                                  SizedBox(width: 5),
                                  SizedBox(
                                      width: 30,
                                      child: Text(
                                        'A',
                                        style: AppTextStyle.inActiveTitle,
                                      ))
                                ],
                              ),
                              // P1_04
                              Row(
                                children: [
                                  Expanded(
                                      child: WidgetInput(
                                          value:
                                              '${widget.paramInverter.p1_04}',
                                          description:
                                              'ការវាយតម្លៃប្រេកង់នៃម៉ូទ័រ',
                                          range: '0.01Hz -> Maximum frequency',
                                          isEditable: true)),
                                  SizedBox(width: 5),
                                  SizedBox(
                                      width: 30,
                                      child: Text(
                                        'Hz',
                                        style: AppTextStyle.inActiveTitle,
                                      ))
                                ],
                              ),
                              // P1_05
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: WidgetInput(
                                    value: '${widget.paramInverter.p1_05}',
                                    description: 'ការវាយតម្លៃល្បឿននៃម៉ូទ័រ',
                                    range: '1 rpm  65535 rpm',
                                    isEditable: true,
                                  )),
                                  SizedBox(width: 5),
                                  Container(
                                      alignment: Alignment.centerRight,
                                      width: 30,
                                      child: Text(
                                        'rpm',
                                        style: AppTextStyle.inActiveTitle,
                                      ))
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                  title: 'ប៉ារ៉ាម៉ែតទូទៅ (ប៉ារ៉ាម៉ែតរបស់ម៉ូទ័រទី១)'),
              // ប៉ារ៉ាម៉ែតទូទៅ (PE Solar control purpose)
              CardConfigParamInverter(
                  content: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name param
                      Expanded(
                          flex: 3,
                          child: Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PE00',
                                style: AppTextStyle.tittleCard,
                              ),
                              Text(
                                'PE16',
                                style: AppTextStyle.tittleCard,
                              ),
                              Text(
                                'PE17',
                                style: AppTextStyle.tittleCard,
                              ),
                              Text(
                                'PE18',
                                style: AppTextStyle.tittleCard,
                              ),
                              Text(
                                'PE19',
                                style: AppTextStyle.tittleCard,
                              ),
                              Text(
                                'PE20',
                                style: AppTextStyle.tittleCard,
                              ),
                              Text(
                                'PE21',
                                style: AppTextStyle.tittleCard,
                              ),
                              Text(
                                'PE22',
                                style: AppTextStyle.tittleCard,
                              ),
                              Text(
                                'PE23',
                                style: AppTextStyle.tittleCard,
                              ),
                              Text(
                                'PE24',
                                style: AppTextStyle.tittleCard,
                              ),
                              Text(
                                'PE25',
                                style: AppTextStyle.tittleCard,
                              ),
                              Text(
                                'PE26',
                                style: AppTextStyle.tittleCard,
                              ),
                              Text(
                                'PE27',
                                style: AppTextStyle.tittleCard,
                              ),
                            ],
                          )),
                      // Value param
                      Expanded(
                          flex: 4,
                          child: Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // PE00
                              Row(
                                children: [
                                  Expanded(
                                      child: WidgetDropdown(
                                    value: '${widget.paramInverter.pe00.value}',
                                    options: {
                                      '${PE_00.ved.value}':
                                          '0: ${PE_00.ved.description}',
                                      '${PE_00.solarPump.value}':
                                          '1: ${PE_00.solarPump.description}',
                                    },
                                    description:
                                        'របៀបគ្រប់គ្រងម៉ាស៊ីនបូមទឹកដើរដោយថាមពលព្រះអាទិត្យ',
                                    range:
                                        '0: VFD, 1: ម៉ាស៊ីនបូមទឹកដើរដោយថាមពលព្រះអាទិត្យ ( Solar Pump)',
                                    isEditable:
                                        widget.isInverterOpen ? true : false,
                                  )),
                                  SizedBox(width: 5),
                                  SizedBox(
                                      width: 30,
                                      child: Text(
                                        'kW',
                                        style: AppTextStyle.inActiveTitle,
                                      ))
                                ],
                              ),
                              // PE16
                              Row(
                                children: [
                                  Expanded(
                                      child: WidgetInput(
                                    value: '${widget.paramInverter.pe16}',
                                    description:
                                        'កម្រិតតង់ស្យុង​ទាបបំផុតដើម្បីបញ្ឈប់ដំណើរការរបស់អាំងវែទ័រ',
                                    range: '0.0 -> 1000V',
                                    isEditable: true,
                                  )),
                                  SizedBox(width: 5),
                                  SizedBox(
                                      width: 30,
                                      child: Text(
                                        'V',
                                        style: AppTextStyle.inActiveTitle,
                                      ))
                                ],
                              ),
                              // PE17
                              Row(
                                children: [
                                  Expanded(
                                      child: WidgetInput(
                                          value: '${widget.paramInverter.pe17}',
                                          description:
                                              'កម្រិតតង់ស្យុងដែលអនុញ្ញាតអោយអាំងវែទ័រដំណើរការ',
                                          range: '0.0 -> 1000V',
                                          isEditable: true)),
                                  SizedBox(width: 5),
                                  SizedBox(
                                      width: 30,
                                      child: Text(
                                        'V',
                                        style: AppTextStyle.inActiveTitle,
                                      ))
                                ],
                              ),
                              // PE18
                              Row(
                                children: [
                                  Expanded(
                                      child: WidgetInput(
                                          value: '${widget.paramInverter.pe18}',
                                          description:
                                              'រយះពេលចាំសម្រាប់អាំងវែរទ័រដំណើរការ',
                                          range: '0 -> 30000sec',
                                          isEditable: true)),
                                  SizedBox(width: 5),
                                  SizedBox(
                                      width: 30,
                                      child: Text(
                                        's',
                                        style: AppTextStyle.inActiveTitle,
                                      ))
                                ],
                              ),
                              // PE19
                              Row(
                                children: [
                                  Expanded(
                                      child: WidgetInput(
                                          value: '${widget.paramInverter.pe19}',
                                          description:
                                              'ការកំណត់ប្រេកង់ឈប់នៅពេលល្បឿនទាប',
                                          range: '0.00 -> 300.00Hz',
                                          isEditable: true)),
                                  SizedBox(width: 5),
                                  SizedBox(
                                      width: 30,
                                      child: Text(
                                        'Hz',
                                        style: AppTextStyle.inActiveTitle,
                                      ))
                                ],
                              ),
                              // PE20
                              Row(
                                children: [
                                  Expanded(
                                      child: WidgetInput(
                                    value: '${widget.paramInverter.pe20}',
                                    description: 'ពេលវេលាកំណត់ការពារប្រេកង់ទាប',
                                    range: '0 -> 30000s',
                                    isEditable: true,
                                  )),
                                  SizedBox(width: 5),
                                  SizedBox(
                                      width: 30,
                                      child: Text(
                                        's',
                                        style: AppTextStyle.inActiveTitle,
                                      ))
                                ],
                              ),
                              // PE21
                              Row(
                                children: [
                                  Expanded(
                                      child: WidgetInput(
                                          value: '${widget.paramInverter.pe21}',
                                          description:
                                              'ពេលវេលាពន្យារការកំណត់ឡើងវិញដោយស្វ័យប្រវត្តិនៃការពារល្បឿនទាប',
                                          range: '0 -> 30000s',
                                          isEditable: true)),
                                  SizedBox(width: 5),
                                  SizedBox(
                                      width: 30,
                                      child: Text(
                                        's',
                                        style: AppTextStyle.inActiveTitle,
                                      ))
                                ],
                              ),
                              // PE22
                              Row(
                                children: [
                                  Expanded(
                                      child: WidgetInput(
                                          value: '${widget.paramInverter.pe22}',
                                          description:
                                              'ចរន្តកំណត់ការពារដំណើរការស្ងួត',
                                          range: '0 -> 999.9A',
                                          isEditable: true)),
                                  SizedBox(width: 5),
                                  SizedBox(
                                      width: 30,
                                      child: Text(
                                        'A',
                                        style: AppTextStyle.inActiveTitle,
                                      ))
                                ],
                              ),
                              // PE23
                              Row(
                                children: [
                                  Expanded(
                                      child: WidgetInput(
                                          value: '${widget.paramInverter.pe23}',
                                          description:
                                              'ពេលវេលាកំណត់ការពារដំណើរការស្ងួត',
                                          range: '0 -> 30000s',
                                          isEditable: true)),
                                  SizedBox(width: 5),
                                  SizedBox(
                                      width: 30,
                                      child: Text(
                                        's',
                                        style: AppTextStyle.inActiveTitle,
                                      ))
                                ],
                              ),
                              // PE24
                              Row(
                                children: [
                                  Expanded(
                                      child: WidgetInput(
                                          value: '${widget.paramInverter.pe24}',
                                          description:
                                              'ពេលវេលាពន្យារការកំណត់ឡើងវិញដោយស្វ័យប្រវត្តិនៃការពារដំណើរការស្ងួត',
                                          range: '0 -> 30000s',
                                          isEditable: true)),
                                  SizedBox(width: 5),
                                  SizedBox(
                                      width: 30,
                                      child: Text(
                                        's',
                                        style: AppTextStyle.inActiveTitle,
                                      ))
                                ],
                              ),
                              // PE25
                              Row(
                                children: [
                                  Expanded(
                                      child: WidgetInput(
                                          value: '${widget.paramInverter.pe25}',
                                          description:
                                              'ចរន្តកំណត់ការពារចរន្តលើស',
                                          range: '0 -> 999.9A',
                                          isEditable: true)),
                                  SizedBox(width: 5),
                                  SizedBox(
                                      width: 30,
                                      child: Text(
                                        'A',
                                        style: AppTextStyle.inActiveTitle,
                                      ))
                                ],
                              ),
                              // PE26
                              Row(
                                children: [
                                  Expanded(
                                      child: WidgetInput(
                                          value: '${widget.paramInverter.pe26}',
                                          description:
                                              'ពេលវេលាកំណត់ការពារចរន្តលើស',
                                          range: '0 -> 30000s',
                                          isEditable: true)),
                                  SizedBox(width: 5),
                                  SizedBox(
                                      width: 30,
                                      child: Text(
                                        's',
                                        style: AppTextStyle.inActiveTitle,
                                      ))
                                ],
                              ),
                              // PE27
                              Row(
                                children: [
                                  Expanded(
                                      child: WidgetInput(
                                          value: '${widget.paramInverter.pe27}',
                                          description:
                                              'ពេលវេលាពន្យារការកំណត់ឡើងវិញដោយស្វ័យប្រវត្តិនៃការពារចរន្តលើស',
                                          range: '0 -> 30000s',
                                          isEditable: true)),
                                  SizedBox(width: 5),
                                  SizedBox(
                                      width: 30,
                                      child: Text(
                                        's',
                                        style: AppTextStyle.inActiveTitle,
                                      ))
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                  title: 'ប៉ារ៉ាម៉ែតទូទៅ (PE Solar control purpose)'),
            ],
          ),
        ),
      ),
    );
  }
}

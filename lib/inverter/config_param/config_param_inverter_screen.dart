import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solar_management_system/routes/app_route.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/style/app_text_style.dart';
import 'package:solar_management_system/widgets/card_config_param_inverter.dart';

class ConfigParamInverterScreen extends StatefulWidget {
  const ConfigParamInverterScreen({super.key});

  @override
  State<ConfigParamInverterScreen> createState() =>
      _ConfigParamInverterScreenState();
}

class _ConfigParamInverterScreenState extends State<ConfigParamInverterScreen>
    with TickerProviderStateMixin {
  bool isExpended = false;
  late Animation<double> _expendable;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _expendable = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
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
              Navigator.pushNamed(context, AppRoute.stationDetail);
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
                color: AppColor.greenDark,
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
              onPressed: () {},
              child: Text(
                'រក្សាទុក',
                style: TextStyle(fontSize: 15, color: AppColor.bluskyLight),
              ))
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
                    // Title
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
                                      '0',
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
                                      '39.01',
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
                                      '528.9',
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
                                      '0',
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
                                      '0',
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
                                      '0',
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
                                      '0',
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
                                    child: widgetDropdown(
                                        "P",
                                        {
                                          "P": "1: P type",
                                          "G": "1: G type",
                                        },
                                        true)),
                                SizedBox(width: 5),
                                SizedBox(width: 30, child: Text(''))
                              ],
                            ),
                            // P0_01
                            Row(
                              children: [
                                Expanded(
                                    child: widgetDropdown(
                                        "VF",
                                        {
                                          "VF": "0: VF control",
                                          "1": "1:  controll",
                                          "2": "2:  controll",
                                          "3": "3:  controll",
                                          "4": "4:  controll",
                                        },
                                        true)),
                                SizedBox(width: 5),
                                SizedBox(width: 30, child: Text(''))
                              ],
                            ),
                            // P0_02
                            Row(
                              children: [
                                Expanded(
                                    child: widgetDropdown(
                                        "0",
                                        {
                                          "0": "0: ON/OFF using Keypad",
                                          "1":
                                              "1: ON/OFF using Terminal Comand",
                                          "2": "2: ON/OFF using RS485",
                                        },
                                        true)),
                                SizedBox(width: 5),
                                SizedBox(width: 30, child: Text(''))
                              ],
                            ),
                            // P0_08
                            Row(
                              children: [
                                Expanded(child: widgetInput('50', true)),
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
                                    child: widgetDropdown(
                                        "0",
                                        {
                                          "0": "0: motor Forward",
                                          "1": "1: motor Reverse",
                                        },
                                        true)),
                                SizedBox(width: 5),
                                SizedBox(width: 30, child: Text(''))
                              ],
                            ),
                            // P0_10
                            Row(
                              children: [
                                Expanded(child: widgetInput('50', false)),
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
                                  Expanded(child: widgetInput('500', true)),
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
                                  Expanded(child: widgetInput('400', true)),
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
                                  Expanded(child: widgetInput('11', true)),
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
                                  Expanded(child: widgetInput('50', true)),
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
                                  Expanded(child: widgetInput('500', true)),
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
                                  Expanded(child: widgetInput('0', true)),
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
                                  Expanded(child: widgetInput('500', false)),
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
                                  Expanded(child: widgetInput('490', true)),
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
                                  Expanded(child: widgetInput('60', true)),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: widgetInput('50', true)),
                                  SizedBox(width: 5),
                                  Container(
                                      alignment: Alignment.centerRight,
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
                                  Expanded(child: widgetInput('0', true)),
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
                                  Expanded(child: widgetInput('0', true)),
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
                                  Expanded(child: widgetInput('10', true)),
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
                                  Expanded(child: widgetInput('20', true)),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: widgetInput('60', true)),
                                  SizedBox(width: 5),
                                  Container(
                                      alignment: Alignment.centerRight,
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
                                  Expanded(child: widgetInput('11', true)),
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
                                  Expanded(child: widgetInput('50', true)),
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
                                  Expanded(child: widgetInput('60', true)),
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

Widget widgetInput(String value, bool isEditable) {
  return SizedBox(
    height: 22,
    child: TextField(
      controller: TextEditingController(
        text: value,
      ),
      keyboardType: TextInputType.number,
      textDirection: TextDirection.rtl,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
          fontSize: 15,
          color: isEditable ? AppColor.primary : AppColor.unfocus),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: BorderSide(color: AppColor.bluskyLight, width: 1),
        ),
        focusColor: AppColor.bluskyLight,
        prefixIcon: IconButton(
          padding: EdgeInsets.zero,
          iconSize: 14,
          icon: Icon(Icons.info_outline, size: 14),
          onPressed: () {},
        ),
      ),
    ),
  );
}

Widget widgetDropdown(
  String value, // the selected short key
  Map<String, String> options, // map of shortKey -> full description
  bool isEditable,
) {
  return SizedBox(
    height: 22,
    child: DropdownButtonFormField<String>(
      value: value,
      // iconDisabledColor: isEditable ? AppColor.primary : AppColor.unfocus,
      iconEnabledColor: isEditable ? AppColor.primary : AppColor.unfocus,
      isExpanded: true,
      style: const TextStyle(fontSize: 15, color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: BorderSide(color: AppColor.bluskyLight, width: 1),
        ),
        prefixIcon: IconButton(
          padding: EdgeInsets.zero,
          iconSize: 14,
          icon: const Icon(Icons.info_outline, size: 14),
          onPressed: () {},
        ),
      ),

      // show shortKey in the box
      selectedItemBuilder: (context) {
        return options.keys.map((shortKey) {
          return Align(
            alignment: Alignment.centerRight,
            child: Text(
              shortKey,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontSize: 15,
                  color: isEditable ? AppColor.primary : AppColor.unfocus),
            ),
          );
        }).toList();
      },

      // show full description in the dropdown menu
      items: options.entries.map((entry) {
        return DropdownMenuItem<String>(
          value: entry.key,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(entry.value, textDirection: TextDirection.rtl),
          ),
        );
      }).toList(),

      onChanged: isEditable
          ? (String? newValue) {
              print("Selected: $newValue");
            }
          : null,
    ),
  );
}

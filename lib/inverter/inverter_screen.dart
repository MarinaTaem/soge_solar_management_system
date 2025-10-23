import 'package:flutter/material.dart';
import 'package:solar_management_system/model/inverter_model.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/widgets/card_inverter_screen.dart';

class InverterScreen extends StatefulWidget {
  const InverterScreen({super.key});

  @override
  State<InverterScreen> createState() => _InverterScreenState();
}

class _InverterScreenState extends State<InverterScreen> {
  List<ParamInverter> paramInverter = [
    ParamInverter(
      nameStation: '',
      nameInverter: '',
      status: false,
      pvPower: 0,
      gridPower: 0,
      outputPower: 0,
      outputFrequency: 0,
      presetFrequency: 39.1,
      pvVoltage: 528.9,
      outputVoltage: 0,
      outputCurrent: 0,
      pvInputCurrent: 0,
      p0_00: P0_00.gType,
      p0_01: P0_01.sensorless,
      p0_02: P0_02.terminalCmd,
      p0_08: 50,
      p0_09: P0_09.motorForward,
      p0_10: 50,
      p1_01: 500,
      p1_02: 400,
      p1_03: 11,
      p1_04: 50,
      p1_05: 500,
      pe00: PE_00.ved,
      pe16: 500,
      pe17: 490,
      pe18: 60,
      pe19: 50,
      pe20: 0,
      pe21: 0,
      pe22: 10,
      pe23: 20,
      pe24: 60,
      pe25: 11,
      pe26: 50,
      pe27: 60,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: CardInverterScreen(
                      paramInverter: paramInverter[0],
                    ));
              })),
    );
  }
}

// Widget widgetCardInverter() {
//   bool isSwitched = false;
//   return Container(
//     height: 300,
//     decoration: BoxDecoration(
//       color: AppColor.primary,
//       borderRadius: BorderRadius.circular(5),
//       boxShadow: [
//         BoxShadow(
//             color: const Color.fromARGB(255, 17, 30, 38),
//             blurRadius: 3,
//             offset: Offset(0, 3))
//       ],
//     ),
//     child: Padding(
//       padding: const EdgeInsets.all(8),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 spacing: 8,
//                 children: [
//                   // logo and status
//                   Container(
//                     width: 20,
//                     height: 20,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                           color: AppColor.greenLight,
//                           width: 2,
//                           strokeAlign: BorderSide.strokeAlignOutside),
//                       borderRadius: BorderRadius.circular(10),
//                       // color: AppColor.bluskyLight
//                       image: DecorationImage(
//                           image: AssetImage('assets/images/image_5.jpg'),
//                           fit: BoxFit.cover),
//                     ),
//                   ),
//                   Text(
//                     'Inverter 1',
//                     style: TextStyle(color: AppColor.textPrimary, fontSize: 15),
//                   )
//                 ],
//               ),
//               Switch(
//                 value: isSwitched,
//                 onChanged: (value) {},
//               )
//             ],
//           )
//         ],
//       ),
//     ),
//   );
// }

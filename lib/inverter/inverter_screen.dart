import 'package:flutter/material.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/widgets/card_inverter_screen.dart';

class InverterScreen extends StatefulWidget {
  const InverterScreen({super.key});

  @override
  State<InverterScreen> createState() => _InverterScreenState();
}

class _InverterScreenState extends State<InverterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 5,
            children: [
              CardInverterScreen(),
              CardInverterScreen(),
              CardInverterScreen(),
            ],
          ),
        ),
      ),
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

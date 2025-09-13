import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solar_management_system/inverter/config_param_inverter_screen.dart';
import 'package:solar_management_system/inverter/history_inverter/inverter_history_screen.dart';
import 'package:solar_management_system/inverter/info_inverter_screen.dart';
import 'package:solar_management_system/style/app_colors.dart';

class InverterModalButtomSheet extends StatefulWidget {
  const InverterModalButtomSheet({super.key});

  @override
  State<InverterModalButtomSheet> createState() =>
      _InverterModalButtomSheetState();
}

class _InverterModalButtomSheetState extends State<InverterModalButtomSheet> {
  bool isTapHistoryFeature = false;
  bool isTapParamFeature = false;
  bool isTapInfoFeature = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
              color: AppColor.textPrimary,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/setting.svg',
                  colorFilter:
                      ColorFilter.mode(AppColor.primary, BlendMode.srcIn),
                  width: 30,
                  height: 30,
                ),
                SizedBox(width: 10),
                Text(
                  'ការកំណត់អាំងវែកទ័រ',
                  style: TextStyle(color: AppColor.primary),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 10,
            children: [
              // View history
              _rowModalBottomSheet(
                'ប្រវត្តិអាំងវែកទ័រ',
                'assets/images/history.svg',
                isOnTap: isTapHistoryFeature,
                onPressed: () {
                  setState(() {
                    isTapHistoryFeature = !isTapHistoryFeature;
                  });
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => const InverterHistoryScreen(),
                    ),
                  );
                },
              ),
              // Config param
              _rowModalBottomSheet(
                'កំណត់ប៉ារ៉ាមែត្រ',
                'assets/images/conf_param.svg',
                isOnTap: isTapParamFeature,
                onPressed: () {
                  setState(() {
                    isTapParamFeature = !isTapParamFeature;
                  });
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => const ConfigParamInverterScreen(),
                    ),
                  );
                },
              ),
              // Inverter info
              _rowModalBottomSheet(
                'ព័ត៌មានអាំងវែកទ័រ',
                'assets/images/information.svg',
                isOnTap: isTapInfoFeature,
                onPressed: () {
                  setState(() {
                    isTapInfoFeature = !isTapInfoFeature;
                  });
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => const InfoInverterScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _rowModalBottomSheet(String feature, String icon,
      {bool isOnTap = false, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isOnTap ? AppColor.bluskyLight : AppColor.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                icon,
                colorFilter:
                    ColorFilter.mode(AppColor.textSecondary, BlendMode.srcIn),
              ),
            ),
            SizedBox(width: 5),
            Text(
              feature,
              style: TextStyle(fontSize: 15, color: AppColor.textPrimary),
            ),
          ],
        ),
      ),
    );
  }
}

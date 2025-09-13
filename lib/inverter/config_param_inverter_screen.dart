import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solar_management_system/routes/app_route.dart';
import 'package:solar_management_system/style/app_colors.dart';

class ConfigParamInverterScreen extends StatefulWidget {
  const ConfigParamInverterScreen({super.key});

  @override
  State<ConfigParamInverterScreen> createState() =>
      _ConfigParamInverterScreenState();
}

class _ConfigParamInverterScreenState extends State<ConfigParamInverterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoute.stationDetail);
            },
            icon: SvgPicture.asset(
              'assets/images/arrow_back.svg',
              colorFilter: ColorFilter.mode(AppColor.primary, BlendMode.srcIn),
            )),
      ),
      body: Center(
        child: Text('Config Param inverter'),
      ),
    );
  }
}

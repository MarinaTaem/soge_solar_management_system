import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solar_management_system/station_detail_screen.dart';
import 'package:solar_management_system/style/app_colors.dart';

class InfoInverterScreen extends StatefulWidget {
  const InfoInverterScreen({super.key});

  @override
  State<InfoInverterScreen> createState() => _InfoInverterScreenState();
}

class _InfoInverterScreenState extends State<InfoInverterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                    builder: (context) => const StationDetailScreen()),
              );
            },
            icon: SvgPicture.asset(
              'assets/images/arrow_back.svg',
              colorFilter: ColorFilter.mode(AppColor.primary, BlendMode.srcIn),
            )),
      ),
      body: Center(
        child: Text('View information Inverter'),
      ),
    );
  }
}

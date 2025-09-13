import 'package:flutter/material.dart';
import 'package:solar_management_system/station_detail_screen.dart';

class AppRoute {
  static const home = '/';
  static const search = '/search';
  static const filter = '/filter';
  static const stationDetail = '/station_detail';
  static const solar = '/station_detail/solar';
  static const inverter = '/station_detail/inverter';
  static const waterGate = '/station_detail/water_gate';
  static const inverterHistory = '/station_detail/inverter_history';
  static const historyInveters = '/inverters_history';
  static const inverterConfParam = '/station_detail/inverter_conf_param';
  static const inverterInfo = '/station_detail/inverter_info';

  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case stationDetail:
        return MaterialPageRoute(builder: (_) => StationDetailScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Not found rout ${setting.name}'),
            ),
          ),
        );
    }
  }
}

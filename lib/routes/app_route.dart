import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:solar_management_system/inverter/history_inverter/inverter_history_screen.dart';
import 'package:solar_management_system/inverter/history_inverters/export_file_inverters/export_file_dashboard.dart';
import 'package:solar_management_system/inverter/history_inverters/export_file_inverters/pdf_preview_screen.dart';
import 'package:solar_management_system/inverter/history_inverters/inverters_history_screen.dart';
import 'package:solar_management_system/station_detail_screen.dart';

class AppRoute {
  static const home = '/';
  static const search = '/search';
  static const filter = '/filter';
  static const stationDetail = '/station_detail';
  static const solar = '/station_detail/solar';
  static const inverter = '/station_detail/inverter';
  static const waterGate = '/station_detail/water_gate';
  //history
  static const invertersHistory = '/station_detail/inverters_history';
  static const pdfInvertersHistory =
      '/station_detail/inverters_history/pdf_inverters_history';
  static const excelInvertersHistory =
      '/station_detail/inverters_history/excel_inverters_history';

  static const inverterHistory = '/station_detail/inverter/inverter_history';
  static const pdfInverterHistory =
      '/station_detail/inverter/inverter_history/pdf_inverter_history';
  static const excelInverterHistory =
      '/station_detail/inverter/inverter_history/excel_inverter_history';

  static const exportFileDashboard = '/export_file_dashboard';
  static const inverterConfParam = '/station_detail/inverter_conf_param';
  static const inverterInfo = '/station_detail/inverter_info';

  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case stationDetail:
        return MaterialPageRoute(builder: (_) => StationDetailScreen());
      case invertersHistory:
        return MaterialPageRoute(builder: (_) => InvertersHistoryScreen());
      case inverterHistory:
        return MaterialPageRoute(builder: (_) => InverterHistoryScreen());
      case pdfInvertersHistory:
        return MaterialPageRoute(
            builder: (_) => PdfPreviewScreen(
                  nameInverter: "",
                  nameStation: "",
                ));

      // case pdfInverterHistory:
      //   return MaterialPageRoute(builder: (_) => InverterHistoryScreen());

      // case exportFileDashboard:
      //   return MaterialPageRoute(builder: (_) => ExportFileDashboard());

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

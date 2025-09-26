import 'package:flutter/material.dart';
import 'package:solar_management_system/routes/app_route.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.stationDetail,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}

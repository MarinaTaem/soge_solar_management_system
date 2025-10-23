import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:solar_management_system/routes/app_route.dart';
import 'package:solar_management_system/style/app_colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidgetBuilder: (_) => const Center(
        child: CircularProgressIndicator(
          color: AppColor.primary,
          strokeWidth: 4,
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoute.stationDetail,
        onGenerateRoute: AppRoute.generateRoute,
      ),
    );

    // return MaterialApp(
    //   home: TestMain(),
    // );
  }
}

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/widgets/snackbar_config_param.dart';

Future clarifyDialog(BuildContext outerContext, {required bool status}) {
  return showDialog(
    context: outerContext,
    builder: (dialogContext) => Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.textPrimary,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'តើអ្នកចង់រក្សាទុកការកំណត់ដែរឬទេ?',
              style: TextStyle(
                fontFamily: 'Khmer',
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Dismiss button
                SizedBox(
                  height: 32,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(dialogContext);
                      await Future.delayed(const Duration(milliseconds: 300));
                      Navigator.of(outerContext)
                          .pop(); // back to station detail - inverter
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    child: Text(
                      'បោះបង់',
                      style: TextStyle(
                        fontFamily: 'Khmer',
                        fontSize: 15,
                        color: AppColor.error,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1.5,
                  height: 32,
                  color: AppColor.primary,
                ),
                // Save button
                SizedBox(
                  height: 32,
                  child: ElevatedButton(
                    onPressed: () async {
                      // loading
                      dialogContext.loaderOverlay.show();
                      await Future.delayed(const Duration(seconds: 2));
                      Navigator.pop(dialogContext);
                      dialogContext.loaderOverlay.hide();
                      // show snackbar
                      final snackBar =
                          snackbar(outerContext, isConnected: status);
                      ScaffoldMessenger.of(outerContext).showSnackBar(snackBar);
                      // back to station detail - inverter
                      Navigator.of(outerContext).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    child: Text(
                      'រក្សាទុក',
                      style: TextStyle(
                        fontFamily: 'Khmer',
                        fontSize: 15,
                        color: AppColor.greenDark,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:solar_management_system/inverter/info_inverter_screen.dart';
import 'package:solar_management_system/style/app_colors.dart';

void messageWarning(BuildContext context) {
  showTopSnackBar(
    Overlay.of(context),
    Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Text(
                'ការភ្ជាប់ត្រូវបានផ្ដាច់​ ការកំណត់នឹងត្រូវបានរក្សាទុក',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Khmer',
                  fontSize: 15,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InfoInverterScreen(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(40, 30),
              ),
              child: SizedBox(
                width: 60,
                child: Column(
                  children: [
                    const Text(
                      'អាំងវែកទ័រ',
                      style: TextStyle(
                        color: AppColor.bluskyLight,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 1),
                      height: 1.5,
                      color: AppColor.bluskyLight,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    displayDuration: const Duration(seconds: 3),
    animationDuration: const Duration(milliseconds: 500),
  );
}

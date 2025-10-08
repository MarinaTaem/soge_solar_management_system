import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solar_management_system/inverter/info_inverter_screen.dart';
import 'package:solar_management_system/style/app_colors.dart';

SnackBar snackbar(BuildContext context, {required bool isConnected}) {
  return SnackBar(
    backgroundColor: Colors.black,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    padding: EdgeInsets.zero,
    content: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isConnected
                  ? SvgPicture.asset(
                      'assets/images/success.svg',
                      height: 24,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                        AppColor.greenDark,
                        BlendMode.srcIn,
                      ),
                    )
                  : SvgPicture.asset(
                      'assets/images/warning.svg',
                      height: 24,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                        AppColor.orangeLight,
                        BlendMode.srcIn,
                      ),
                    ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    isConnected
                        ? Text(
                            'កែតម្រូវជោគជ័យ',
                            style: TextStyle(
                              fontFamily: 'Khmer',
                              color: AppColor.greenDark,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                        : Text(
                            'ការជូនដំណឹង',
                            style: TextStyle(
                              fontFamily: 'Khmer',
                              color: AppColor.orangeLight,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Expanded(
                          child: isConnected
                              ? Text(
                                  'ប៉ារ៉ាមែត្រត្រូវបានកំណត់រួចរាល់',
                                  style: TextStyle(
                                    fontFamily: 'Khmer',
                                    color: AppColor.textSecondary,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                )
                              : Text(
                                  'ការផ្ជាប់ត្រូវបានផ្ដាច់ ការកំណត់នឹងត្រូវបានរក្សាទុក',
                                  style: TextStyle(
                                    fontFamily: 'Khmer',
                                    color: AppColor.textSecondary,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                        ),
                        // Go to Inverter info
                        if (isConnected = false)
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const InfoInverterScreen(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(40, 20),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'អាំងវែកទ័រ',
                              style: TextStyle(color: AppColor.bluskyLight),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            icon: SvgPicture.asset(
              'assets/images/delete.svg',
              colorFilter: ColorFilter.mode(
                AppColor.textSecondary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

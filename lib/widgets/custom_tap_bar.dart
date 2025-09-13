// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:solar_management_system/style/app_colors.dart';

class CustomTapBar extends StatelessWidget {
  const CustomTapBar({super.key});

  @override
  Widget build(BuildContext context) {
    final TabController controller = DefaultTabController.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(3, (index) {
            final bool selected = controller.index == index;
            final labels = ['ប្រចាំថ្ងៃ', 'ប្រចាំខែ', 'ប្រចាំឆ្នាំ'];
            return GestureDetector(
              onTap: () => controller.animateTo(index),
              child: Container(
                height: 25,
                width: (MediaQuery.of(context).size.width - 50) / 3,
                decoration: BoxDecoration(
                  color: selected ? AppColor.primary : AppColor.textSecondary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    labels[index],
                    style: TextStyle(
                        color:
                            selected ? AppColor.textPrimary : AppColor.unfocus,
                        fontSize: 15),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solar_management_system/style/app_colors.dart';
import 'package:solar_management_system/style/app_text_style.dart';

class CardConfigParamInverter extends StatefulWidget {
  late Widget content;
  late String title;
  CardConfigParamInverter(
      {super.key, required this.content, required this.title});

  @override
  State<CardConfigParamInverter> createState() =>
      _CardConfigParamInverterState();
}

class _CardConfigParamInverterState extends State<CardConfigParamInverter>
    with TickerProviderStateMixin {
  bool isExpended = false;
  late Animation<double> _expendable;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _expendable = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller;
    super.dispose();
  }

  void toggle() {
    setState(() => isExpended = !isExpended);
    if (isExpended) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColor.textPrimary,
          boxShadow: [
            BoxShadow(
              color: AppColor.black,
              offset: Offset(0, 4),
              blurRadius: 4,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              widgetTitle(isExpended, widget.title, toggle),
              SizeTransition(
                sizeFactor: _expendable,
                axis: Axis.vertical,
                axisAlignment: -1.0,
                child: Container(
                  color: AppColor.textPrimary,
                  child: Container(
                    margin: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.primary),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: widget.content),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget widgetTitle(bool isExpend, String title, VoidCallback onToggle) {
  return GestureDetector(
    onTap: onToggle,
    child: Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isExpend ? AppColor.primary : AppColor.textPrimary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: isExpend ? AppColor.textPrimary : AppColor.primary,
              ),
            ),
          ),
          SizedBox(
            width: 16,
            height: 16,
            child: SvgPicture.asset(
              isExpend
                  ? 'assets/images/arrow_down.svg'
                  : 'assets/images/arrow_up.svg',
              colorFilter: ColorFilter.mode(
                isExpend ? AppColor.textPrimary : AppColor.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget widgetBlank() {
  return Container(
    margin: EdgeInsets.only(bottom: 4),
    child: Row(
      spacing: 3,
      children: [
        Container(
          height: 1,
          width: 10,
          color: AppColor.textSecondary,
        ),
        Container(
          height: 1,
          width: 10,
          color: AppColor.textSecondary,
        ),
        Container(
          height: 1,
          width: 10,
          color: AppColor.textSecondary,
        ),
        Container(
          height: 1,
          width: 10,
          color: AppColor.textSecondary,
        ),
      ],
    ),
  );
}

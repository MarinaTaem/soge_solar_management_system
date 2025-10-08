import 'package:el_tooltip/el_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:solar_management_system/style/app_colors.dart';

class WidgetInput extends StatefulWidget {
  final String value;
  final bool isEditable;
  final String description;
  final String range;

  const WidgetInput({
    required this.value,
    required this.isEditable,
    required this.description,
    required this.range,
    super.key,
  });

  @override
  State<WidgetInput> createState() => _WidgetInputState();
}

class _WidgetInputState extends State<WidgetInput> {
  late final TextEditingController _controller;
  final ElTooltipController _tooltipController = ElTooltipController();
  bool _tooltipVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  void _toggleTooltip() {
    setState(() {
      if (_tooltipVisible) {
        _tooltipController.hide();
        _tooltipVisible = false;
      } else {
        _tooltipController.show();
        _tooltipVisible = true;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22,
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        textDirection: TextDirection.rtl,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          fontSize: 15,
          color: widget.isEditable ? AppColor.primary : AppColor.unfocus,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: BorderSide(color: AppColor.bluskyLight, width: 1),
          ),
          prefixIcon: ElTooltip(
            controller: _tooltipController,
            content: SizedBox(
              width: 120,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Khmer',
                      color: AppColor.primary,
                    ),
                    softWrap: true,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.range,
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Khmer',
                      color: AppColor.unfocus,
                    ),
                    softWrap: true,
                  ),
                ],
              ),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              iconSize: 14,
              icon: const Icon(Icons.info_outline, size: 14),
              onPressed: _toggleTooltip,
            ),
          ),
        ),
        readOnly: !widget.isEditable,
      ),
    );
  }
}

import 'package:el_tooltip/el_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:solar_management_system/style/app_colors.dart';

class WidgetDropdown extends StatefulWidget {
  final String value;
  final Map<String, String> options;
  final bool isEditable;
  final String description;
  final String range;

  const WidgetDropdown({
    required this.value,
    required this.options,
    required this.isEditable,
    required this.description,
    required this.range,
    super.key,
  });

  @override
  State<WidgetDropdown> createState() => _WidgetDropdownState();
}

class _WidgetDropdownState extends State<WidgetDropdown> {
  final ElTooltipController _controller = ElTooltipController();
  bool _tooltipVisible = false;

  void _toggleTooltip() {
    setState(() {
      if (_tooltipVisible) {
        _controller.hide();
        _tooltipVisible = false;
      } else {
        _controller.show();
        _tooltipVisible = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22,
      child: DropdownButtonFormField<String>(
        value: widget.value,
        iconEnabledColor:
            widget.isEditable ? AppColor.primary : AppColor.unfocus,
        isExpanded: true,
        style: const TextStyle(fontSize: 15, color: Colors.black),
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
          // Tooptip Message
          prefixIcon: ElTooltip(
            controller: _controller,
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
        selectedItemBuilder: (context) {
          return widget.options.keys.map((key) {
            return Align(
              alignment: Alignment.centerRight,
              child: Text(
                key,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 15,
                  color:
                      widget.isEditable ? AppColor.primary : AppColor.unfocus,
                ),
              ),
            );
          }).toList();
        },
        items: widget.options.entries.map((entry) {
          return DropdownMenuItem<String>(
            value: entry.key,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(entry.value),
            ),
          );
        }).toList(),
        onChanged: widget.isEditable
            ? (newValue) {
                print("Selected: $newValue");
              }
            : null,
      ),
    );
  }
}

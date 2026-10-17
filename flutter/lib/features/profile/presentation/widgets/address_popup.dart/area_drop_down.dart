import 'package:flutter/material.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';

class AreaDropdown extends StatefulWidget {
  const AreaDropdown({
    super.key,
    required this.items,
    this.initialValue,
    this.onChanged,
  });

  final List<String> items;
  final String? initialValue;
  final ValueChanged<String?>? onChanged;

  @override
  State<AreaDropdown> createState() => _AreaDropdownState();
}

class _AreaDropdownState extends State<AreaDropdown> {
  static const _bg = AppColors.dropdownBg;
  static const _iconColor = AppColors.gray500;
  static const _textColor = AppColors.dropdownText;

  late String? _value = widget.initialValue ?? widget.items.first;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: _bg,
          borderRadius: BorderRadius.circular(16),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _value,
            isExpanded: true,
            itemHeight: 64,
            dropdownColor: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            // In RTL, this lands on the far left, as in the screenshot.
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: _iconColor,
              size: 26,
            ),
            // Collapsed view: map icon on the right + text.
            selectedItemBuilder: (context) => widget.items
                .map(
                  (e) => Row(
                    children: [
                      const Icon(Icons.map_outlined, color: _iconColor, size: 26),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          e,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 17,
                            color: _textColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
            items: widget.items
                .map(
                  (e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(
                      e,
                      style: const TextStyle(fontSize: 16, color: _textColor),
                    ),
                  ),
                )
                .toList(),
            onChanged: (v) {
              setState(() => _value = v);
              widget.onChanged?.call(v);
            },
          ),
        ),
      ),
    );
  }
}

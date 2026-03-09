import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';

Widget ToggleButton({
  required String title,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 38,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? Color(0xffe1edeb) : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isSelected)
            const Icon(Icons.check, size: 18, color: Color(0xff4A4459)),
          if (isSelected) const SizedBox(width: 8),
          Text(
            title,
            style: Styles.textStyle16Medium.copyWith(color: Color(0xff4A4459)),
          ),
        ],
      ),
    ),
  );
}

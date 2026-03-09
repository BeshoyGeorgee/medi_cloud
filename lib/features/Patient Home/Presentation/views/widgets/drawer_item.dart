import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';

Widget drawerItem({
  IconData? icon,
  String? imagePath,
  required String title,
  required VoidCallback onTap,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.only(left: 40),
    leading:
        icon != null
            ? Icon(icon, color: Colors.grey[600], size: 26)
            : Image.asset(imagePath!, width: 26, height: 26),
    title: Text(
      title,
      style: Styles.textStyle18Medium.copyWith(color: Colors.black87),
    ),
    onTap: onTap,
  );
}

import 'package:flutter/material.dart';
import 'package:medi_cloud_app/constant.dart';

// ميثود لبناء الـ TextField بالديزاين المطلوب
Widget customFieldForDoctorSyndicateClaim({
  required String hint,
  int maxLines = 1,
  Color? hintColor,
}) {
  return TextField(
    maxLines: maxLines,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: hintColor ?? Colors.grey),
      filled: true,
      fillColor: kPrimaryColor.withOpacity(
        0.15,
      ), // اللون الأخضر الفاتح جداً اللي في الصورة
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15), // حواف دائرية واضحة
        borderSide: BorderSide.none,
      ),
    ),
  );
}

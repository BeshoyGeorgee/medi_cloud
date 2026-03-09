import 'package:flutter/material.dart';

// Label للنصوص اللي فوق الحقول
Widget customeLabel(String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Color(0xff0D1B34),
      ),
    ),
  );
}

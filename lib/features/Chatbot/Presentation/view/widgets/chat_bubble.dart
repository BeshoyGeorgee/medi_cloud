import 'package:flutter/material.dart';
import 'package:medi_cloud_app/constant.dart';

Widget ChatBubble({
  required String message,
  required bool isBot,
  required String time,
}) {
  return Column(
    crossAxisAlignment:
        isBot ? CrossAxisAlignment.start : CrossAxisAlignment.end,
    children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: isBot ? kPrimaryColor : const Color(0xffE8E8E8),
          borderRadius: BorderRadius.only(
            // الزوايا العلوية دايماً دائرية
            topLeft: const Radius.circular(24),
            topRight: const Radius.circular(24),
            // الزاوية السفلية اليسرى: لو بوت تبقى حادة (0)، لو يوزر تبقى دائرية
            bottomLeft: Radius.circular(isBot ? 4 : 24),
            // الزاوية السفلية اليمنى: لو بوت تبقى دائرية، لو يوزر تبقى حادة (0)
            bottomRight: Radius.circular(isBot ? 24 : 4),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isBot ? Colors.white : Colors.black87,
            fontSize: 15,
            height: 1.3, // عشان تظبط المسافات بين السطور زي الصورة
          ),
        ),
      ),
      // الوقت تحت الفقاعة بمسافة بسيطة
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          time,
          style: const TextStyle(color: Color(0xff9E9E9E), fontSize: 12),
        ),
      ),
      const SizedBox(height: 12),
    ],
  );
}

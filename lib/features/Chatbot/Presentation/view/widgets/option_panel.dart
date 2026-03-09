import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/features/Chatbot/Presentation/view/widgets/option_button.dart';

Widget OptionsPanel() {
  return Container(
    padding: const EdgeInsets.all(25),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35),
        topRight: Radius.circular(35),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Choose an Option:",
          style: Styles.textStyle18Bold.copyWith(color: Color(0xff16504B)),
        ),
        const SizedBox(height: 20),
        OptionButton("Chest Pain or discomfort"),
        OptionButton("Shortness of breathh"), // مكتوبة كدة في الصورة
        OptionButton("Irregular Heartbeat"),
        OptionButton("Fatigue or weakness"),
        const SizedBox(height: 70), // مسافة عشان الـ Bottom Nav Bar
      ],
    ),
  );
}

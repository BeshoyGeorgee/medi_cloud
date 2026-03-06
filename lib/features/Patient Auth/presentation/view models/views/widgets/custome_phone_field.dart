import 'package:flutter/material.dart';
// الـ Import الصحيح للمكتبة اللي أنت ضايفها في الـ pubspec
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';

import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

class CustomPhoneField extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final Function(String)? onChanged; // أضفنا السطر ده

  const CustomPhoneField({
    super.key,
    this.controller,
    required this.title,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.textStyle18Bold.copyWith(
            color: const Color(0xff0D1B34),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        IntlPhoneField(
          controller: controller,
          languageCode: "en",
          // اختيار الـ Decoration الموحد لـ MediCloud
          decoration: InputDecoration(
            hintText: '0000 000-000',
            hintStyle: Styles.textStyle16.copyWith(
              color: kPrimaryColor.withOpacity(0.6),
            ),
            filled: true,
            fillColor: kTexrFieldFillColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            counterText: "",
          ),
          initialCountryCode: 'EG',
          dropdownIcon: const Icon(
            Icons.keyboard_arrow_down,
            color: kGreyColor,
          ),
          dropdownTextStyle: const TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
          // إعدادات صندوق اختيار الدول
          pickerDialogStyle: PickerDialogStyle(
            searchFieldPadding: const EdgeInsets.all(16),
            countryCodeStyle: const TextStyle(color: kPrimaryColor),
          ),
          onChanged: (phone) {
            if (onChanged != null) {
              // بنبعت الرقم كامل بالكود (مثلاً +2010...)
              onChanged!(phone.completeNumber);
            }
          },
        ),
      ],
    );
  }
}

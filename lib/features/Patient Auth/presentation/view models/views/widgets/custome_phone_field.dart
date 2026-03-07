import 'package:flutter/material.dart';
// الـ Import الصحيح للمكتبة اللي أنت ضايفها في الـ pubspec
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';

import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

class CustomPhoneField extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomPhoneField({
    super.key,
    this.controller,
    required this.title,
    this.onChanged,
    this.validator,
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
          invalidNumberMessage: "Invalid phone number",
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: '0000 000-000',
            hintStyle: Styles.textStyle16.copyWith(
              color: kPrimaryColor.withOpacity(0.6),
            ),
            filled: true,
            fillColor: kTexrFieldFillColor,
            
            // 1. البوردر الأساسي (بدون فوكس وبدون خطأ)
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            
            // 2. البوردر وقت الخطأ (ده اللي بيخلي الراديوس يثبت)
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),

            // 3. البوردر وقت الخطأ وإنت دايس جوه الخانة (مهم جداً للراديوس)
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red, width: 2.0),
            ),

            // 4. البوردر وقت ما ميكونش فيه خطأ وإنت دايس جوه الخانة
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: kPrimaryColor, width: 1.0),
            ),

            errorStyle: const TextStyle(
              fontSize: 11,
              color: Colors.red,
            ),
            
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
          pickerDialogStyle: PickerDialogStyle(
            searchFieldPadding: const EdgeInsets.all(16),
            countryCodeStyle: const TextStyle(color: kPrimaryColor),
          ),
          onChanged: (phone) {
            if (onChanged != null) {
              onChanged!(phone.completeNumber);
            }
          },
        ),
      ],
    );
  }
}
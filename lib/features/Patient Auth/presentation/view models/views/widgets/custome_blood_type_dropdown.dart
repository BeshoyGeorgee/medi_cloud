import 'package:flutter/material.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';

class CustomBloodTypeDropdown extends StatelessWidget {
  final String? value;
  final Function(String?) onChanged;
  // 1. ضفنا الـ validator هنا
  final String? Function(String?)? validator; 

  const CustomBloodTypeDropdown({
    super.key,
    required this.value,
    required this.onChanged,
    this.validator, // ضفنا الـ validator في الـ Constructor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Blood Type",
          style: Styles.textStyle20.copyWith(
            color: const Color(0xff0D1B34),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          value: value,
          // 2. ربط الـ validator بالـ Widget الأصلية
          validator: validator, 
          hint: Text(
            "ab",
            style: Styles.textStyle16.copyWith(
              color: kPrimaryColor.withOpacity(0.6),
            ),
          ),
          selectedItemBuilder: (context) {
            return ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"].map((e) {
              return Text(
                e,
                style: Styles.textStyle16.copyWith(
                  color: Colors.black, // شلنا الـ Opacity هنا عشان لما يختار يبان واضح
                ),
              );
            }).toList();
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: kTexrFieldFillColor,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 15,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            // تظبيط شكل البوردر وقت الخطأ (عشان يفضل 15 radius)
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            prefixIcon: const Icon(
              Icons.keyboard_arrow_down,
              color: kGreyColor,
            ),
          ),
          iconSize: 0,
          items: ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"].map((type) {
            return DropdownMenuItem(
              value: type,
              child: Text(type, style: Styles.textStyle16),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
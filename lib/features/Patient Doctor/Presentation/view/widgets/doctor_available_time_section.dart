import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

class DoctorAvailableTimeSection extends StatelessWidget {
  const DoctorAvailableTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppDecorations.borderRadius25,
        boxShadow: [AppDecorations.defaultShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Section Title ---
          Text(
            'Available Time',
            style: Styles.textStyle16Bold.copyWith(color: Colors.black87),
          ),
          const SizedBox(height: 12),
          
          // --- Section Body ---
          Text(
            'Working Days : Monday - Thursday\nWorking Hours : 09:30 AM - 01:00 PM',
            style: Styles.textStyle14.copyWith(color: kGreyColor, height: 1.6),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/app_images.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

class DoctorProfileHeader extends StatelessWidget {
  const DoctorProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // --- Doctor Image ---
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            Assets.imagesDoctorCard, // Use the correct asset variable for the doctor
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        
        // --- Doctor Name ---
        Text(
          'Dr. Warren',
          style: Styles.textStyle18Bold.copyWith(color: Colors.black87),
        ),
        const SizedBox(height: 4),
        
        // --- Hospital Name ---
        Text(
          'Saudi German',
          style: Styles.textStyle14.copyWith(color: kGreyColor),
        ),
      ],
    );
  }
}
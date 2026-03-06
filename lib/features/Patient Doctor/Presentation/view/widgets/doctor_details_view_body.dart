import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_button.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart';
import 'package:medi_cloud_app/constant.dart';
import 'doctor_profile_header.dart';
import 'doctor_about_section.dart';
import 'doctor_available_time_section.dart';

class DoctorDetailsViewBody extends StatelessWidget {
  const DoctorDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // --- 1. Top App Bar ---
        const CustomAppBar(
          title: 'Doctor Profile',
          iconColor: kShadePrimaryColor,
          textColor: kShadePrimaryColor,
        ),
        
        // --- 2. Scrollable Content ---
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: const [
                SizedBox(height: 24),
                DoctorProfileHeader(), 
                SizedBox(height: 12),
                DoctorAboutSection(), 
                SizedBox(height: 16),
                DoctorAvailableTimeSection(), 
                SizedBox(height: 24), // Extra bottom padding for scroll
              ],
            ),
          ),
        ),
        
        // --- 3. Fixed Bottom Action Button ---
        // MOVED HERE: Outside the Expanded so it stays fixed at the bottom
       // --- 3. Fixed Bottom Action Button ---
        // Wrapped with SafeArea to prevent the button from overlapping with device's bottom navigation bar or home indicator
        SafeArea(
          child: Padding(
            // Increased the bottom padding to give the button a nice floating look
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0, top: 8.0),
            child: CustomButton(
              text: 'Request to follow up',
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSuccessDocComfView);
              },
            ),
          ),
        ),
      ],
    );
  }
}
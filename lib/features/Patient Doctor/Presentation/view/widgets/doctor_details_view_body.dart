import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_expandable_section.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Doctor/Presentation/view/widgets/follow_doc_boutton.dart';
import 'doctor_profile_header.dart';
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
                CustomExpandableSection(
                  title: 'About Me',
                  shortText: 'Dr. Carly Angel is the top most immunologists specialist in Crist Hospital in London, UK. ',
                  fullText: 'Dr. Carly Angel is the top most immunologists specialist in Crist Hospital in London, UK. She has over 15 years of experience in treating autoimmune diseases and allergies. She is dedicated to providing the best care for her patients using modern technology.',
                ),
                SizedBox(height: 16),
                DoctorAvailableTimeSection(),
                SizedBox(height: 24), // Extra bottom padding for scroll
              ],
            ),
          ),
        ),

        // --- 3. Fixed Bottom Action Button ---
        FollowDocB(),
      ],
    );
  }
}


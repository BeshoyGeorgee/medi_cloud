import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_button.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_expandable_section.dart';
import 'hospital_details_header.dart';
import 'hospital_location_section.dart';

class HospitalDetailsViewBody extends StatelessWidget {
  const HospitalDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // --- 1. الجزء اللي بيسحب (Scrollable Content) ---
        Expanded(
          child: SingleChildScrollView(
            // EdgeInsets.zero عشان الهيدر يلزق في سقف الشاشة زي الديزاين
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                // سكشن 1: الهيدر (صورة + جريديانت أسود + اسم المستشفى)
                const HospitalDetailsHeader(),

                // باقي السكاشن واخدة مسافات من الجناب
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: const [
                      // سكشن 2: عن المستشفى (استخدمنا الويدجت الكاستم)
                      CustomExpandableSection(
                        title: 'About Hospital',
                        shortText:
                            'Dr. Carly Angel is the top most immunologists specialist in Crist Hospital in London, UK.',
                        fullText:
                            'Dr. Carly Angel is the top most immunologists specialist in Crist Hospital in London, UK. The hospital provides world-class healthcare services and uses the latest technology to ensure patient safety and comfort.',
                      ),

                      SizedBox(height: 16),

                      // سكشن 3: الخريطة (المربوطة بالـ Cubit عشان تفتح جوجل ماب)
                      HospitalLocationSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // --- 2. الزرار الثابت تحت (Fixed Action Button) ---
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              bottom: 24.0,
              top: 8.0,
            ),
            child: CustomButton(
              text: 'Join To Hospital',
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSuccessHospitalJoinView);
              },
            ),
          ),
        ),
      ],
    );
  }
}

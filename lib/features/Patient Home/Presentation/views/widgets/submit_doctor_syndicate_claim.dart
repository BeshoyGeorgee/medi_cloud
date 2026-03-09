import 'package:flutter/material.dart';

import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/custome_field_for_doctor_syndicate_claim.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/custome_label.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/submit_button.dart';

class SubmitDoctorSyndicateClaim extends StatelessWidget {
  const SubmitDoctorSyndicateClaim({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FB), // نفس خلفية الأبلكيشن الموحدة
      body: Column(
        children: [
          // الـ App Bar بنفس التصميم المطلوب
          const CustomAppBar(title: "Doctor syndicate"),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 80), // مسافة كبيرة للعنوان زي الصورة

                  const Text(
                    "Submit a complaint",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0D1B34), // اللون الأزرق الغامق
                    ),
                  ),

                  const SizedBox(height: 40),

                  // حقل اسم الدكتور (Doctor Username)
                  customeLabel("Doctor Username"),
                  const SizedBox(height: 8),
                  customFieldForDoctorSyndicateClaim(
                    hint: "abdulrhman@medicloud.com",
                    hintColor: kPrimaryColor,
                  ),

                  const SizedBox(height: 20),

                  // حقل التفاصيل (Details)
                  customFieldForDoctorSyndicateClaim(
                    hint: "Details",
                    maxLines: 5,
                    hintColor: kPrimaryColor,
                  ),

                  const SizedBox(height: 60),

                  // زرار الـ Submit (صغير في النص)
                  SubmitButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

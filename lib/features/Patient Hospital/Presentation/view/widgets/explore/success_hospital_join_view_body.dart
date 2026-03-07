import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_button.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_success_card.dart'; // تأكد من المسار

class SuccessHospitalJoinViewBody extends StatelessWidget {
  const SuccessHospitalJoinViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Padding من الجناب عشان الكارت ميبقاش لازق في الشاشة
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // توسيط في نص الشاشة بالظبط
        children: [
          // --- 1. الكارت الكاستم بتاعنا ---
          const CustomSuccessCard(
            message: 'Your request has been\nsuccessfully',
          ),
          
          const SizedBox(height: 40),
          
          // --- 2. الزرار ---
          // حطيناه جوه SizedBox عشان نتحكم في عرضه ويبقى شكله زي الديزاين بالظبط
          SizedBox(
            width: 250, 
            child: CustomButton(
              text: 'show hospital doctors',
              onPressed: () {
                 GoRouter.of(context).pushReplacement(AppRouter.kExploreDoctorsView); // حط اسم الراوت بتاع الدكاترة بتاعك
              },
            ),
          ),
        ],
      ),
    );
  }
}
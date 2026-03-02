import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_button.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/success_registration_card.dart';

class SuccessRegistrationView extends StatelessWidget {
  const SuccessRegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FA), // لون هادي للخلفية
      body: SizedBox(
        width: double.infinity, // عشان يضمن التوسيط الأفقي
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // توسيط رأسي
          crossAxisAlignment: CrossAxisAlignment.center, // توسيط أفقي
          children: [
            // الكارت الأبيض اللي فيه علامة الصح
            SucessRegistrationCard(),
            const SizedBox(height: 60), // مسافة بين الكارت والزرار
            // زرار الـ Log in
            CustomButton(
              text: "Log in",
              width: 191,
              onPressed: () {
                // استخدام go بيمسح أي صفحات قديمة ويروح للي إنت عايزه
                GoRouter.of(context).go(AppRouter.kPatientLoginView);
              },
            ),
          ],
        ),
      ),
    );
  }
}

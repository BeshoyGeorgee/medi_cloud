import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/constant.dart';

class RequestButton extends StatelessWidget {
  const RequestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140, // الزرار في الصورة واخد عرض محدد مش full width
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          GoRouter.of(context).push(
            AppRouter.kSuccessClaimScreenView,
            extra: () {
              // يروح لصفحة النقابة بعد ما يخلص طلب التحليل
              GoRouter.of(context).push(AppRouter.kSubmitDoctorSyndicateClaim);
            },
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          "Request",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/constant.dart';

// زرار الـ Submit
Widget SubmitButton(BuildContext context) {
  return SizedBox(
    width: 160, // عرض متوسط زي الصورة
    height: 50,
    child: ElevatedButton(
      onPressed: () {
        GoRouter.of(context).push(
          AppRouter.kSuccessClaimScreenView,
          extra: () {
            // هنا بقى لازم يرجع للهوم مش يروح لنفسه تاني
            GoRouter.of(context).go(AppRouter.kPatientMainScreen);
          },
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 0,
      ),
      child: const Text(
        "Submit",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/app_images.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';


class CustomDoctorCard extends StatelessWidget {
  const CustomDoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        // استخدام الشادو الموحد بتاعك من الكونست
        boxShadow: [
          AppDecorations.bottomBarShadow, 
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- الجزء الأول: صورة الدكتور ---
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                Assets.imagesDoctorCard, // استخدمنا المتغير اللي الإكستنشن عمله
                width: double.infinity,
                fit: BoxFit.cover, // عشان الصورة تملأ المكان بشكل احترافي
              ),
            ),
          ),
          
          // --- الجزء الثاني: بيانات الدكتور ---
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dr. Warren',
                  style: Styles.textStyle16Bold.copyWith(color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis, // عشان لو الاسم طويل الكارت ميبُظش
                ),
                const SizedBox(height: 4),
                Text(
                  'Saudi German',
                  style: Styles.textStyle14.copyWith(color: kGreyColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis, // عشان اسم المستشفى لو طويل
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
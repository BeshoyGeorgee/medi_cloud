import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/app_images.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

Widget UploadSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.08), // خلفية خضراء خفيفة جداً
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.blue,
          width: 1.5,
        ), // هنا ممكن تستخدم حزمة dotted_border لو عايزه منقط
      ),
      child: Column(
        children: [
          Image.asset(Assets.imagesUploadFileIcon, width: 80),
          const SizedBox(height: 10),
          Text(
            "Select Report from device",
            style: Styles.textStyle18.copyWith(
              color: Color(0xff454545),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 13),
          Text(
            "Supported formats: JPEG, PNG, PDF",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
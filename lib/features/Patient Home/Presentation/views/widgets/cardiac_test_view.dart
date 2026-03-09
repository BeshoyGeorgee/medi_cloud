import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/request_button.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/upload_section.dart';

class CardiacTestView extends StatelessWidget {
  const CardiacTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xffF8F9FB,
      ), // لون الخلفية الهادي اللي في الصورة
      body: Column(
        children: [
          const CustomAppBar(title: "Make claim"),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 33),
              child: Column(
                children: [
                  const SizedBox(height: 120),

                  // العنوان الرئيسي
                  Text(
                    "Primary Care\nExamination Request",
                    textAlign: TextAlign.center,
                    style: Styles.textStyle24Bold.copyWith(
                      color: Color(0xff0D1B34),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // حقل الـ Details (Multi-line)
                  TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Details",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // منطقة رفع الملفات (Upload Section)
                  UploadSection(),

                  const SizedBox(height: 40),

                  // زرار الـ Request
                  const RequestButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/constant.dart'; // To use kPrimaryColor
import 'package:medi_cloud_app/Core/utils/app_images.dart'; // To use Assets
// تأكد من مسار الكارت بناءً على مكان الفولدر عندك
import 'package:medi_cloud_app/features/Patient%20Hospital/Presentation/view/widgets/dashboard/test_result_card.dart';

class TestResultsListView extends StatelessWidget {
  const TestResultsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: 2, // Number of items based on the design
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        if (index == 0) {
          return TestResultCard(
            tagText: 'Blood Test',
            // Used the shared primary color instead of the hardcoded hex
            tagColor: kPrimaryColor,
            title: 'Complete Blood Count (CBC)',
            labName: 'Apollo Diagnostics',
            doctorName: 'Dr. Priya Sharma',
            date: '20/2/2025',
            // Make sure these match the exact variable names in your app_images.dart
            iconAsset:
                Assets.imagesBloodTest, // Assuming you named it like this
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kTestResultPdfView,
                extra:
                    Assets
                        .pdfsSampleReport, // استخدمنا المتغير اللي لسه ضايفينه هنا
              );
            },
          );
        } else {
          return TestResultCard(
            tagText: 'Genetic Test',
            // Used the shared primary color
            tagColor: kPrimaryColor,
            title: 'BRCA Gene Test',
            labName: 'Apollo Diagnostics',
            doctorName: 'Dr. Priya Sharma',
            date: '20/2/2025',
            // Make sure these match the exact variable names in your app_images.dart
            iconAsset: Assets.imagesDna, // Assuming you named it like this
            onTap: () {
                  GoRouter.of(context).push(
                AppRouter.kTestResultPdfView,
                extra:
                    Assets
                        .pdfsSampleReport, 
              );
            },
          );
        }
      },
    );
  }
}

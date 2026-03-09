import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/constant.dart';
// تأكد من مسار الراوتر بتاعك
import 'package:medi_cloud_app/Core/utils/app_router.dart'; 

class HealthReportTab extends StatelessWidget {
  const HealthReportTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, 
      
      // --- حالة عدم وجود تقارير (Empty State) ---
      body: const Center(
        child: Text(
          'No reports yet',
          style: TextStyle(
            fontSize: 16,
            color: kGreyColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      
     // --- زرار الإضافة ---
      floatingActionButton: Padding(
        // هنا نقدر نتحكم في مكانه.. 20 من تحت ترفعه، و 8 من اليمين تدخله لجوه شوية
        padding: const EdgeInsets.only(bottom: 20.0, right: 8.0), 
        child: FloatingActionButton(
          onPressed: () {
            // هيروح لشاشة طلب التقرير
            GoRouter.of(context).push(AppRouter.kRequestReportView); 
          },
          backgroundColor: kPrimaryColor,
          elevation: 4,
          shape: const CircleBorder(), 
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
      ),
    );
  }
}
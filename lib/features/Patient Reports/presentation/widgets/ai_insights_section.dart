import 'package:flutter/material.dart';
import 'package:medi_cloud_app/constant.dart';

class AiInsightsSection extends StatelessWidget {
  final String insights;
  const AiInsightsSection({super.key, required this.insights});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // كبرنا الـ Padding لـ 24 عشان يدي براح
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppDecorations.borderRadius25, 
        boxShadow: const [AppDecorations.defaultShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'AI Insights & Recommendations',
            // كبرنا حجم العنوان لـ 18
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: kDarkTextColor),
          ),
          const SizedBox(height: 20),
          Text(
            insights,
            // كبرنا خط النص لـ 15، وزودنا الـ height لـ 1.6 عشان السطور تبعد عن بعض شوية
            style: const TextStyle(fontSize: 15, color: kGreyColor, height: 1.6, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 30), 
        ],
      ),
    );
  }
}
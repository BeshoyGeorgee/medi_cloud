import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Reports/presentation/view%20model/reports_cubit.dart';
// import 'package:go_router/go_router.dart'; // عشان الـ Navigation

class AveragesSection extends StatelessWidget {
  final ReportsLoaded state;
  const AveragesSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AverageMetricCard(
            title: 'Avg Heart Rate',
            value: '${state.avgHeartRate} BPM',
            trendText: state.hrTrend,
            isTrendDown: state.isHrTrendDown,
            onTap: () {
             GoRouter.of(context).push(AppRouter.kHeartRateDetailsView);
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: AverageMetricCard(
            title: 'Avg HRV',
            value: '${state.avgHrv} ms',
            trendText: state.hrvTrend,
            isTrendDown: state.isHrvTrendDown,
            onTap: () {
              // التفاصيل الخاصة بالـ HRV
            },
          ),
        ),
      ],
    );
  }
}

// الويدجت الخاصة بالكارت الواحد
// الويدجت الخاصة بالكارت الواحد
class AverageMetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String trendText;
  final bool isTrendDown;
  final VoidCallback onTap;

  const AverageMetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.trendText,
    required this.isTrendDown,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color trendColor = isTrendDown ? Colors.green : Colors.red;
    IconData trendIcon = isTrendDown ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        // كبرنا الـ Padding هنا عشان الكارت يكبر
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppDecorations.borderRadius16, 
          boxShadow: const [AppDecorations.defaultShadow], 
        ),
        child: Column(
          children: [
            // كبرنا حجم العنوان لـ 14
            Text(title, style: const TextStyle(fontSize: 14, color: kDarkTextColor, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16), // زودنا المسافة
            // كبرنا حجم الرقم الأساسي لـ 26
            Text(value, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: kDarkTextColor)),
            const SizedBox(height: 16), // زودنا المسافة
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(trendIcon, color: trendColor, size: 18), // كبرنا الأيقونة
                const SizedBox(width: 6),
                // كبرنا خط النسبة المئوية
                Text(trendText, style: TextStyle(fontSize: 13, color: trendColor, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Reports/presentation/view%20model/reports_cubit.dart';

class MetricsGridSection extends StatelessWidget {
  final ReportsLoaded state;
  const MetricsGridSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        // 1. قللنا الرقم هنا عشان ندي للكارت ارتفاع (Height) أكبر
        childAspectRatio: 1.8,
      ),
      children: [
        MetricGridItem(title: 'Weekly Max', value: '${state.weeklyMax} BPM'),
        MetricGridItem(title: 'Weekly Min', value: '${state.weeklyMin} BPM'),
        MetricGridItem(
          title: 'Resting HR Avg',
          value: '${state.restingHrAvg} BPM',
        ),
        MetricGridItem(
          title: 'Time in Normal Range',
          value: '${state.timeInNormalRange}%',
        ),
      ],
    );
  }
}

class MetricGridItem extends StatelessWidget {
  final String title;
  final String value;

  const MetricGridItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      // 2. ظبطنا الـ Padding الداخلي عشان ندي مساحة أكبر للنص
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppDecorations.borderRadius16,
        boxShadow: const [AppDecorations.defaultShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              color: kDarkTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          // 3. استخدمنا FittedBox كحماية إضافية عشان لو الشاشة صغيرة يصغر الخط بدل ما يضرب إيرور
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: kDarkTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

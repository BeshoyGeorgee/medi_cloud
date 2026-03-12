import 'package:flutter/material.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Reports/presentation/view%20model/reports_cubit.dart';

class HeartRateSummaryCard extends StatelessWidget {
  final ReportsLoaded state;
  const HeartRateSummaryCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    Color trendColor = state.isHrTrendDown ? Colors.green : Colors.red;
    Color trendBgColor =
        state.isHrTrendDown
            ? Colors.green.withValues(alpha: 0.15)
            : Colors.red.withValues(alpha: 0.15);
    IconData trendIcon =
        state.isHrTrendDown
            ? Icons.keyboard_arrow_down
            : Icons.keyboard_arrow_up;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppDecorations.borderRadius16,
        boxShadow: const [AppDecorations.defaultShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '${state.avgHeartRate} BPM',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: kDarkTextColor,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: trendBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(trendIcon, color: trendColor, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      state.hrTrend,
                      style: TextStyle(
                        fontSize: 12,
                        color: trendColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Your Normal Range: 60 - 100 BPM',
            style: TextStyle(
              fontSize: 16,
              color: kGreyColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart';
import 'package:medi_cloud_app/features/Patient%20Reports/presentation/view%20model/reports_cubit.dart';
import 'package:medi_cloud_app/features/Patient%20Reports/presentation/widgets/metrics_grid_section.dart';
import 'package:medi_cloud_app/features/Patient%20Reports/presentation/widgets/weekly_chart_section.dart';
import 'package:medi_cloud_app/features/Patient%20Reports/presentation/widgets/what_does_this_mean_section.dart';

// استدعاء السكاشن
import 'date_selector_section.dart'; // هنستخدم نفس الملف بتاع الشاشة اللي فاتت
import 'heart_rate_summary_card.dart';


class HeartRateDetailsViewBody extends StatelessWidget {
  const HeartRateDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Custom App Bar
        const CustomAppBar(
          title: 'Heart Rate Details',
          textColor: kShadePrimaryColor,
        ),
        
        Expanded(
          child: BlocBuilder<ReportsCubit, ReportsState>(
            builder: (context, state) {
              if (state is ReportsLoading || state is ReportsInitial) {
                return const Center(child: CircularProgressIndicator(color: kPrimaryColor));
              }

              if (state is ReportsLoaded) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0),
                  child: Column(
                    children: [
                      // 2. Date Selector Section (Reused)
                      DateSelectorSection(state: state),

                      // 3. Heart Rate Summary Card
                      HeartRateSummaryCard(state: state),
                      const SizedBox(height: 24),

                      // 4. Weekly Heart Rate Chart
                      WeeklyChartSection(chartPoints: state.weeklyChartPoints),
                      const SizedBox(height: 24),

                      // 5. Metrics Grid Section (Max, Min, Avg, Range)
                      MetricsGridSection(state: state),
                      const SizedBox(height: 24),

                      // 6. What does this mean section
                      const WhatDoesThisMeanSection(),
                      const SizedBox(height: 24),
                    ],
                  ),
                );
              }

              return const Center(child: Text('Error loading details', style: TextStyle(color: kDarkTextColor)));
            },
          ),
        ),
      ],
    );
  }
}
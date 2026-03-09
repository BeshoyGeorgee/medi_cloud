import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_button.dart';
import 'package:medi_cloud_app/features/Patient%20Live%20Vitals/Data/live_vitals_cubit.dart';

class GenericVitalsChart extends StatelessWidget {
  final String title;
  final String averageValue;
  final String minValue;
  final String maxValue;

  const GenericVitalsChart({
    super.key,
    required this.title,
    required this.averageValue,
    required this.minValue,
    required this.maxValue,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LiveVitalsCubit, LiveVitalsState>(
      builder: (context, state) {
        if (state is! LiveVitalsDataUpdated) {
          return const SizedBox(
            height: 300,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final currentState = state;

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppDecorations.borderRadius25,
            boxShadow: [AppDecorations.defaultShadow],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Header ---
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Color(0xff0B1124),
                ),
              ),
              const SizedBox(height: 12),

              // --- Filters ---
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xffF4F5F7),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    _buildFilterItem(context, 'D', currentState.activeFilter),
                    _buildDivider(),
                    _buildFilterItem(context, 'W', currentState.activeFilter),
                    _buildDivider(),
                    _buildFilterItem(context, 'M', currentState.activeFilter),
                    _buildDivider(),
                    _buildFilterItem(context, '3M', currentState.activeFilter),
                    _buildDivider(),
                    _buildFilterItem(
                      context,
                      'Other',
                      currentState.activeFilter,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // --- Date Selector ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, size: 20),
                    color: Colors.black,
                    onPressed:
                        () =>
                            context.read<LiveVitalsCubit>().navigatePrevious(),
                  ),
                  Text(
                    currentState.dateRangeString,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      color: Color(0xff0B1124),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward, size: 20),
                    color:
                        currentState.canGoNext
                            ? Colors.black
                            : Colors.grey.shade300,
                    onPressed:
                        currentState.canGoNext
                            ? () =>
                                context.read<LiveVitalsCubit>().navigateNext()
                            : null,
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // --- Chart Area ---
              SizedBox(
                height: 220,
                child: Stack(
                  children: [
                    // الجراف الحيوي هنا
                    LineChart(
                      LineChartData(
                        minY: 20,
                        maxY: 140,
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: false,
                          getDrawingHorizontalLine:
                              (value) => FlLine(
                                color: Colors.grey.shade200,
                                strokeWidth: 1,
                              ),
                        ),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 20,
                              reservedSize: 35,
                              getTitlesWidget:
                                  (value, meta) => Text(
                                    value.toInt().toString(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                            ),
                          ),
                          bottomTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        borderData: FlBorderData(show: false),
                        // السطر السحري: بياخد النقط من الـ State ويرسمها
                        lineBarsData:
                            currentState.hasData
                                ? [
                                  LineChartBarData(
                                    spots:
                                        currentState
                                            .chartPoints, // النقط جاية من الكيوبت
                                    isCurved:
                                        true, // عشان الخط يكون ناعم مش مكسر
                                    color: kPrimaryColor, // لون الأبلكيشن
                                    barWidth: 3, // سمك الخط
                                    isStrokeCapRound: true,
                                    dotData: const FlDotData(
                                      show: true,
                                    ), // إظهار النقط على الخط
                                    belowBarData: BarAreaData(
                                      show: true,
                                      color: kPrimaryColor.withAlpha(
                                        30,
                                      ), // شادو خفيف تحت الخط
                                    ),
                                  ),
                                ]
                                : [], // لو مفيش داتا بيفضل فاضي
                      ),
                      // أنيميشن ناعم لما الداتا تتغير
                      duration: const Duration(milliseconds: 250),
                    ),

                    // رسالة No Data تظهر لو مفيش داتا (زي فلتر Other)
                    if (!currentState.hasData)
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'No data',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Color(0xff0B1124),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Select another time range',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff0B1124),
                              ),
                            ),
                            const SizedBox(height: 16),
                            CustomButton(
                              text: 'Add Records',
                              width: 190,
                              backgroundColor: kPrimaryColor,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // --- Bottom Stats ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard(
                    'Your Average',
                    currentState.hasData ? averageValue : '-',
                  ),
                  _buildStatCard('Min', currentState.hasData ? minValue : '-'),
                  _buildStatCard('Max', currentState.hasData ? maxValue : '-'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterItem(
    BuildContext context,
    String filter,
    String activeFilter,
  ) {
    bool isSelected = activeFilter == filter;
    return Expanded(
      child: GestureDetector(
        onTap: () => context.read<LiveVitalsCubit>().changeFilter(filter),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            boxShadow:
                isSelected
                    ? [
                      BoxShadow(
                        color: Colors.black.withAlpha(10),
                        blurRadius: 4,
                      ),
                    ]
                    : null,
          ),
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            filter,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color:
                  isSelected ? const Color(0xff0B1124) : Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() =>
      Container(width: 1, height: 20, color: Colors.grey.shade300);

  Widget _buildStatCard(String title, String value) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xffF4F5F7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Color(0xff0B1124),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Color(0xff0B1124),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

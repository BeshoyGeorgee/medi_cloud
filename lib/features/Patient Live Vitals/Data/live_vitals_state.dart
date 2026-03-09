part of 'live_vitals_cubit.dart';

abstract class LiveVitalsState {}

class LiveVitalsInitial extends LiveVitalsState {}

class LiveVitalsDataUpdated extends LiveVitalsState {
  final String activeFilter;
  final String dateRangeString;
  final bool canGoNext;
  final bool hasData;
  final List<FlSpot> chartPoints; // ضفنا دي عشان نشيل نقط الرسم البياني

  LiveVitalsDataUpdated({
    required this.activeFilter,
    required this.dateRangeString,
    required this.canGoNext,
    required this.hasData,
    required this.chartPoints, // استقبلناها هنا
  });
}
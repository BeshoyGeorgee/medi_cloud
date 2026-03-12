part of 'reports_cubit.dart';

abstract class ReportsState {}

class ReportsInitial extends ReportsState {}

class ReportsLoading extends ReportsState {}

// الحالة دي هتشيل كل الداتا اللي محتاجينها في الشاشتين
class ReportsLoaded extends ReportsState {
  final String dateRangeString; // مثال: "Feb 1-7"
  final bool canGoNext; // عشان نقفل سهم اليمين لو وصلنا للأسبوع الحالي

  // داتا الشاشة التانية (Health Progress Report)
  final int avgHeartRate;
  final String hrTrend; // مثال: "3% vs last week"
  final bool isHrTrendDown; // عشان نحدد السهم أخضر لتحت ولا أحمر لفوق
  
  final int avgHrv;
  final String hrvTrend;
  final bool isHrvTrendDown;

  final String aiInsights; // النص بتاع الـ AI

  // داتا الشاشة التالتة (Heart Rate Details)
  final int weeklyMax;
  final int weeklyMin;
  final int restingHrAvg;
  final int timeInNormalRange; // كنسبة مئوية %
  final List<FlSpot> weeklyChartPoints; // نقط الجراف بتاع الأسبوع

  ReportsLoaded({
    required this.dateRangeString,
    required this.canGoNext,
    required this.avgHeartRate,
    required this.hrTrend,
    required this.isHrTrendDown,
    required this.avgHrv,
    required this.hrvTrend,
    required this.isHrvTrendDown,
    required this.aiInsights,
    required this.weeklyMax,
    required this.weeklyMin,
    required this.restingHrAvg,
    required this.timeInNormalRange,
    required this.weeklyChartPoints,
  });
}

class ReportsError extends ReportsState {
  final String message;
  ReportsError(this.message);
}
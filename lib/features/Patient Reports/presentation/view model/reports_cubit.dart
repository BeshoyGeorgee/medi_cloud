import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart'; // عشان الجراف

part 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  // بنبدأ دايماً بالأسبوع الحالي
  DateTime _currentWeekStart = _getStartOfWeek(DateTime.now());

  ReportsCubit() : super(ReportsInitial()) {
    // أول ما الكيوبت يشتغل، يحمل داتا الأسبوع الحالي
    loadReportData();
  }

  // دالة مساعدة عشان تجيب أول يوم في الأسبوع (الأحد أو الإثنين حسب ما تحب، هنخليها الأحد هنا)
  static DateTime _getStartOfWeek(DateTime date) {
    return date.subtract(Duration(days: date.weekday % 7));
  }

  // الدالة الأساسية لتحميل الداتا
void loadReportData() {
    emit(ReportsLoading());

    Future.delayed(const Duration(milliseconds: 500), () {
      
      final endDate = _currentWeekStart.add(const Duration(days: 6));
      final DateFormat formatter = DateFormat('MMM d');
      String dateString = '${formatter.format(_currentWeekStart)}-${endDate.day}';

      bool canGoNext = _currentWeekStart.isBefore(_getStartOfWeek(DateTime.now()));
      int randomFactor = _currentWeekStart.day; 

      // 1. هنا بنولد قراءات الـ 7 أيام الأول عشان نربط بيها كل حاجة
      List<int> dailyBPMs = [
        65 + (randomFactor % 10), // Sun
        70 + (randomFactor % 15), // Mon
        68 + (randomFactor % 8),  // Tue
        85 + (randomFactor % 25), // Wed (يوم فيه مجهود عالي شوية)
        75 + (randomFactor % 12), // Thu
        60 + (randomFactor % 5),  // Fri (يوم راحة)
        72 + (randomFactor % 14), // Sat
      ];

      // 2. بنرسم النقط بتاعت الجراف من نفس الأرقام
      List<FlSpot> spots = [];
      for (int i = 0; i < dailyBPMs.length; i++) {
        spots.add(FlSpot(i.toDouble(), dailyBPMs[i].toDouble()));
      }

      // 3. بنحسب الماكس والمينيموم والمتوسط الفعلي من نفس الليست
      int actualMax = dailyBPMs.reduce((curr, next) => curr > next ? curr : next);
      int actualMin = dailyBPMs.reduce((curr, next) => curr < next ? curr : next);
      int sum = dailyBPMs.reduce((curr, next) => curr + next);
      int actualAvg = (sum / dailyBPMs.length).round();

      emit(ReportsLoaded(
        dateRangeString: dateString,
        canGoNext: canGoNext,
        
        // --- الداتا المربوطة ببعضها دلوقتي ---
        avgHeartRate: actualAvg, 
        weeklyMax: actualMax,
        weeklyMin: actualMin,
        restingHrAvg: actualMin + 2, // وقت الراحة بيكون قريب من المينيموم
        weeklyChartPoints: spots, // نفس النقط اللي اتحسب منها الأرقام فوق

        // باقي الداتا زي ما هي
        hrTrend: '${(randomFactor % 4) + 1}% vs last week',
        isHrTrendDown: randomFactor % 2 == 0, 
        avgHrv: 40 + (randomFactor % 10),
        hrvTrend: '${(randomFactor % 6) + 1}% vs last week',
        isHrvTrendDown: randomFactor % 2 != 0,
        aiInsights: 'Your heart rate variability has been stable this week. Keep up the good work and maintain your sleep schedule!',
        timeInNormalRange: 85 + (randomFactor % 10), 
      ));
    });
  }
  // السهم الشمال (الأسبوع اللي فات)
  void previousWeek() {
    _currentWeekStart = _currentWeekStart.subtract(const Duration(days: 7));
    loadReportData();
  }

  // السهم اليمين (الأسبوع الجاي)
  void nextWeek() {
    if (_currentWeekStart.isBefore(_getStartOfWeek(DateTime.now()))) {
      _currentWeekStart = _currentWeekStart.add(const Duration(days: 7));
      loadReportData();
    }
  }
}
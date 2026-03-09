import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart'; // ضفنا مكتبة الجراف هنا عشان الـ FlSpot

part 'live_vitals_state.dart';

class LiveVitalsCubit extends Cubit<LiveVitalsState> {
  DateTime _currentFocusDate = DateTime.now();
  String _activeFilter = 'D'; 

  LiveVitalsCubit() : super(LiveVitalsInitial()) {
    _updateRangeAndEmit();
  }

  void _updateRangeAndEmit() {
    String rangeString = '';
    final DateFormat formatter = DateFormat('MMM d'); 
    List<FlSpot> generatedPoints = []; // دي اللستة اللي هتشيل النقط

    if (_activeFilter == 'D') {
      rangeString = formatter.format(_currentFocusDate);
      // داتا وهمية ليوم واحد (X: الساعات، Y: النبض)
      generatedPoints = const [FlSpot(0, 65), FlSpot(6, 70), FlSpot(12, 85), FlSpot(18, 62), FlSpot(23, 68)];
    } else if (_activeFilter == 'W') {
      final startDate = _currentFocusDate.subtract(Duration(days: _currentFocusDate.weekday - 1));
      final endDate = startDate.add(const Duration(days: 6));
      rangeString = '${formatter.format(startDate)}–${formatter.format(endDate).split(' ')[1]}';
      // داتا أسبوع (X: أيام الأسبوع من 1 لـ 7)
      generatedPoints = const [FlSpot(1, 62), FlSpot(2, 80), FlSpot(3, 75), FlSpot(4, 90), FlSpot(5, 68), FlSpot(6, 72), FlSpot(7, 65)];
    } else if (_activeFilter == 'M') {
      final startDate = DateTime(_currentFocusDate.year, _currentFocusDate.month, 1);
      final lastDay = DateTime(_currentFocusDate.year, _currentFocusDate.month + 1, 0).day;
      rangeString = '${DateFormat('MMM').format(startDate)} 1–$lastDay';
      // داتا شهر (X: أيام الشهر 1, 10, 20, 30)
      generatedPoints = const [FlSpot(1, 70), FlSpot(10, 85), FlSpot(20, 65), FlSpot(30, 78)];
    } else if (_activeFilter == '3M') {
      final startDate = DateTime(_currentFocusDate.year, _currentFocusDate.month - 2, 1);
      rangeString = '${DateFormat('MMM').format(startDate)}–${formatter.format(_currentFocusDate)}';
      // داتا 3 شهور
      generatedPoints = const [FlSpot(1, 75), FlSpot(2, 65), FlSpot(3, 80)];
    } else {
      rangeString = 'Custom Range';
      // الـ Other هنسيبه فاضي [] عشان يظهر رسالة No data
      generatedPoints = [];
    }

    bool canGoNext = !_isSameDay(_currentFocusDate, DateTime.now());
    bool hasData = generatedPoints.isNotEmpty; // لو اللستة مش فاضية، يبقى فيه داتا

    emit(LiveVitalsDataUpdated(
      activeFilter: _activeFilter,
      dateRangeString: rangeString,
      canGoNext: canGoNext,
      hasData: hasData, 
      chartPoints: generatedPoints, // بعتنا النقط للـ State
    ));
  }

  void changeFilter(String newFilter) {
    _activeFilter = newFilter;
    _currentFocusDate = DateTime.now();
    _updateRangeAndEmit();
  }

  void navigatePrevious() {
    if (_activeFilter == 'D') _currentFocusDate = _currentFocusDate.subtract(const Duration(days: 1));
    else if (_activeFilter == 'W') _currentFocusDate = _currentFocusDate.subtract(const Duration(days: 7));
    else if (_activeFilter == 'M') _currentFocusDate = DateTime(_currentFocusDate.year, _currentFocusDate.month - 1, 1);
    else if (_activeFilter == '3M') _currentFocusDate = DateTime(_currentFocusDate.year, _currentFocusDate.month - 3, 1);
    _updateRangeAndEmit();
  }

  void navigateNext() {
    if (!_isSameDay(_currentFocusDate, DateTime.now())) {
      if (_activeFilter == 'D') _currentFocusDate = _currentFocusDate.add(const Duration(days: 1));
      else if (_activeFilter == 'W') _currentFocusDate = _currentFocusDate.add(const Duration(days: 7));
      else if (_activeFilter == 'M') _currentFocusDate = DateTime(_currentFocusDate.year, _currentFocusDate.month + 1, 1);
      else if (_activeFilter == '3M') _currentFocusDate = DateTime(_currentFocusDate.year, _currentFocusDate.month + 3, 1);
      _updateRangeAndEmit();
    }
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }
}
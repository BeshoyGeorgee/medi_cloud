import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:medi_cloud_app/constant.dart';

class WeeklyChartSection extends StatelessWidget {
  final List<FlSpot> chartPoints;
  const WeeklyChartSection({super.key, required this.chartPoints});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppDecorations.borderRadius16, // من الثوابت
        boxShadow: const [AppDecorations.defaultShadow], // من الثوابت
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Weekly Heart Rate',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: kDarkTextColor),
          ),
          const SizedBox(height: 30),
          
          // حجزنا مساحة بارتفاع 220 للجراف عشان ياخد راحته
          SizedBox(
            height: 220,
            child: LineChart(
              _mainData(),
            ),
          ),
        ],
      ),
    );
  }

  // --- إعدادات الجراف الأساسية ---
  LineChartData _mainData() {
    return LineChartData(
      // 1. تحديد أقل وأعلى قيمة على المحاور عشان نظبط الـ Scale
      minX: 0,
      maxX: 6,
      minY: 20,
      maxY: 140,

      // 2. خطوط الشبكة (Grid) الأفقية بس زي الديزاين
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false, // شيلنا الخطوط الطولية
        horizontalInterval: 20, // كل 20 درجة نحط خط
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.grey.shade200,
            strokeWidth: 1,
          );
        },
      ),

      // 3. العناوين (الأيام على الـ X والأرقام على الـ Y)
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        
        // أرقام الـ Y (محور الصادات)
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 20,
            reservedSize: 32, // مساحة للكلمة
            getTitlesWidget: (value, meta) {
              return Text(
                value.toInt().toString(),
                style: const TextStyle(color: kGreyColor, fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              );
            },
          ),
        ),

        // أيام الأسبوع الـ X (محور السينات)
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: (value, meta) {
              const style = TextStyle(color: kGreyColor, fontSize: 12, fontWeight: FontWeight.bold);
              Widget text;
              switch (value.toInt()) {
                case 0: text = const Text('Sun', style: style); break;
                case 1: text = const Text('Mon', style: style); break;
                case 2: text = const Text('Tue', style: style); break;
                case 3: text = const Text('Wed', style: style); break;
                case 4: text = const Text('Thu', style: style); break;
                case 5: text = const Text('Fri', style: style); break;
                case 6: text = const Text('Sat', style: style); break;
                default: text = const Text('', style: style); break;
              }
              return Padding(padding: const EdgeInsets.only(top: 10.0), child: text);
            },
          ),
        ),
      ),

      // 4. إخفاء الإطار الخارجي للجراف عشان يبقى Clean زي الديزاين
      borderData: FlBorderData(show: false),

      // 5. رسم الخط نفسه (النقط، الكيرف، والظل اللي تحته)
      lineBarsData: [
        LineChartBarData(
          spots: chartPoints, // الداتا اللي جاية من الكيوبت (FlSpot)
          isCurved: true, // بيخلي الخط ناعم مش منكسر
          color: kPrimaryColor, // لون الخط
          barWidth: 3, // سمك الخط
          isStrokeCapRound: true,
          
          // النقط اللي على الجراف
          dotData: const FlDotData(show: true),
          
          // الظل اللي تحت الخط (استخدمنا withValues عشان الـ Warning)
          belowBarData: BarAreaData(
            show: true,
            color: kPrimaryColor.withValues(alpha: 0.15), 
          ),
        ),
      ],
    );
  }
}
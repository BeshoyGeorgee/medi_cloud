import 'package:flutter/material.dart';
import 'package:medi_cloud_app/features/Patient%20Live%20Vitals/Presentation/view/widgets/generic_vitals_chart.dart';


class HeartRateSection extends StatelessWidget {
  const HeartRateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const GenericVitalsChart(
      title: 'Heart Rate',
      averageValue: '65 BPM',
      minValue: '60 BPM',
      maxValue: '80 BPM',
    );
  }
}
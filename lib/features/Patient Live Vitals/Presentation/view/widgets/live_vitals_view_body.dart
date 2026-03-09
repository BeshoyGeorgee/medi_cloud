import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart'; // ظبط المسار
import 'package:medi_cloud_app/features/Patient%20Live%20Vitals/Presentation/view/widgets/generate_pin_card.dart';
import 'package:medi_cloud_app/features/Patient%20Live%20Vitals/Presentation/view/widgets/heart_rate_section.dart'; // ظبط المسار

class LiveVitalsBody extends StatelessWidget {
  const LiveVitalsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomAuthAppBar(title: 'Live Vitals'),
          
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                GeneratePinCard(),
                SizedBox(height: 24),
                HeartRateSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
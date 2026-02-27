import 'package:flutter/material.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/connect_wearable_device.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/custom_home_appbar.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/heart_rate_card.dart';

class PatientHomeViewBody extends StatelessWidget {
  const PatientHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Column(
          children: [
            CustomHomeAppbar(),
            SizedBox(height: 30),
            HeartRateCard(),
            SizedBox(height: 30),
            ConnectWerableDevice(),
          ],
        ),
      ),
    );
  }
}

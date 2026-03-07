import 'package:flutter/material.dart';
import 'package:medi_cloud_app/features/Patient%20Hospital/Presentation/view/widgets/explore/success_hospital_join_view_body.dart';

class SuccessHospitalJoinView extends StatelessWidget {
  const SuccessHospitalJoinView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // SafeArea عشان المحتوى ميمسحش في النوتش أو البار اللي تحت
      body: SafeArea(
        child: SuccessHospitalJoinViewBody(),
      ),
    );
  }
}
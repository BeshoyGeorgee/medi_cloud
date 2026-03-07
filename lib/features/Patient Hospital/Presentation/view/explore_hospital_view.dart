import 'package:flutter/material.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Hospital/Presentation/view/widgets/explore/explore_hospital_body.dart';

class ExploreHospitalView extends StatelessWidget {
  const ExploreHospitalView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kBackgroundColor,
      body: ExploreHospitalBody(),
    );
  }
}
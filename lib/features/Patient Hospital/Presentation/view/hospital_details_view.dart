import 'package:flutter/material.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Hospital/Presentation/view/widgets/explore/hospital_details_view_body.dart';

class HospitalDetailsView extends StatelessWidget {
  const HospitalDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: HospitalDetailsViewBody(),
    );
  }
}
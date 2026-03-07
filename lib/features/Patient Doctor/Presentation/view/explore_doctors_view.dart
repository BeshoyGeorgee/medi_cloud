import 'package:flutter/material.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Doctor/Presentation/view/widgets/explore_doctors_view_body.dart';

class ExploreDoctorsView extends StatelessWidget {
  const ExploreDoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: ExploreDoctorsViewBody(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/patient_home_view_body.dart';

class PatientHomeView extends StatelessWidget {
  const PatientHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PatientHomeViewBody(),
    );
  }
}
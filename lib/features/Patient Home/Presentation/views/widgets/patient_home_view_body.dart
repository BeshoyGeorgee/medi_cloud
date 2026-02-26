import 'package:flutter/material.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/custom_home_appbar.dart';

class PatientHomeViewBody extends StatelessWidget {
  const PatientHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomHomeAppbar(),
      ],
    );
  }
}
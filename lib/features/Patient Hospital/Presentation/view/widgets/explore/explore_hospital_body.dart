import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart';
import 'package:medi_cloud_app/constant.dart';

class ExploreHospitalBody extends StatelessWidget {
  const ExploreHospitalBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const CustomAppBar(
          title: 'Doctors',
          iconColor: kShadePrimaryColor,
          textColor: kShadePrimaryColor,
        ),
      ],
    );
  }
}
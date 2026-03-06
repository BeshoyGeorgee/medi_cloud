import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart';
import 'package:medi_cloud_app/constant.dart';

class ExploreDoctorsViewBody extends StatelessWidget {
  const ExploreDoctorsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(
          title: 'Doctors',
          iconColor: kShadePrimaryColor,
          textColor: kShadePrimaryColor,
        ),
        
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_search_bar.dart'; // استدعاء السيرش
import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Doctor/Presentation/view/widgets/custom_doctor_grid.dart';

class ExploreDoctorsViewBody extends StatelessWidget {
  const ExploreDoctorsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(
          title: 'Doctors',
          iconColor: kShadePrimaryColor,
          textColor: kShadePrimaryColor,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const CustomSearchBar(hintText: 'Search for cardio doctor...'),
                const SizedBox(height: 24),
                const Expanded(child: CustomDoctorGrid()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

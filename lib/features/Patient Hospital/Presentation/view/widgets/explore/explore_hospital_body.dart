import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_search_bar.dart';
import 'package:medi_cloud_app/constant.dart';

// استدعي ملف الجريد الجديد اللي لسه عاملينه
import 'explore_hospitals_grid.dart';

class ExploreHospitalBody extends StatelessWidget {
  const ExploreHospitalBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // --- 1. App Bar ---
        const CustomAppBar(
          title: 'Hospitals',
          iconColor: kShadePrimaryColor,
          textColor: kShadePrimaryColor,
        ),

        // --- 2. Body Content (Search + Grid) ---
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: const [
                CustomSearchBar(hintText: 'Search for hospital...'),

                ExploreHospitalsGrid(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

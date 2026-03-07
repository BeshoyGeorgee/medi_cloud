import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/custom_list_view.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/recomnd_hospital_card.dart';

class RecommendHospitalSection extends StatelessWidget {
  const RecommendHospitalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- Header Section: Title & See All ---
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recommend Hospital',
              style: Styles.textStyle22Bold.copyWith(color: kShadePrimaryColor),
            ),
            TextButton(
              onPressed: () {
                 GoRouter.of(context).push(AppRouter.kExploreHospitalView);
              },
              child: Text(
                'See all',
                style: Styles.textStyle16.copyWith(
                  color: const Color(0xFF5A75A6),
                ),
              ),
            ),
          ],
        ),

        // --- Horizontal List View Section (Reusable) ---
        // Calling our newly created custom list view and passing the HospitalCard
        const CustomHorizontalListView(
          height: 130, // Suitable height for the Hospital Card
          itemCount: 4,
          itemWidget:
              RecomndHospitalCard(), // Passing the specific card for this section
        ),
      ],
    );
  }
}

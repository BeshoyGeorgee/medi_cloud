import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/custom_list_view.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/recommend_doc_card.dart';

class RecommendDoctorSection extends StatelessWidget {
  const RecommendDoctorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recommend Doctor',
              style: Styles.textStyle22Bold.copyWith(color: kShadePrimaryColor),
            ),
            TextButton(
              onPressed: () {
                debugPrint('See all doctors pressed');
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
        
        const SizedBox(height: 15),
        
        // Calling the updated card name
        const CustomHorizontalListView(
          height: 145, 
          itemCount: 4,
          // Updated here:
          itemWidget: RecommendDoctorCard(), 
        ),
      ],
    );
  }
}
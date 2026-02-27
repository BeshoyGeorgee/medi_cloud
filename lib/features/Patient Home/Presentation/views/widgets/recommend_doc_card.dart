import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/custom_outline_button.dart';

// Changed name to RecommendDoctorCard to avoid conflicts with future Doctor widgets
class RecommendDoctorCard extends StatelessWidget {
  const RecommendDoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310, 
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppDecorations.borderRadius25,
        boxShadow: [AppDecorations.defaultShadow],
      ),
      child: Row(
        children: [
          // --- Doctor Image ---
       
          const SizedBox(width: 16),
          
          // --- Doctor Info & Action ---
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dr. Warner', 
                  style: Styles.textStyle18Bold.copyWith(color: kShadePrimaryColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '5 years of experience', 
                  style: Styles.textStyle14.copyWith(color: kGreyColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 38,
                  width: 100,
                  child: CustomOutlinedButton(
                    text: 'follow up',
                    onPressed: () {
                      debugPrint('Request to follow up pressed');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
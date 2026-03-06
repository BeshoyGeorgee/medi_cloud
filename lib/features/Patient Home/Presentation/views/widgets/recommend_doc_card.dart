import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/app_images.dart'; // Make sure this is correct
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/custom_outline_button.dart';

class RecommendDoctorCard extends StatelessWidget {
  const RecommendDoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310, 
      height: 140, // Fixed height for the card
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppDecorations.borderRadius25,
        boxShadow: [AppDecorations.defaultShadow],
      ),
      child: Row(
        children: [
          // --- Doctor Image Section ---
          // Removed the Stack and Gradient to keep the image colors sharp and natural
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
              child: Image.asset(
                // Using your new image asset
                Assets.imagesDocCard2, 
                // Adjusted width to give the image a well-proportioned space
                width: 105, 
                height: double.infinity,
                fit: BoxFit.cover, 
              ),
            ),
          ),
          
          // --- Spacing ---
          // Added this SizedBox to push all the details cleanly to the right
          const SizedBox(width: 16),
          
          // --- Doctor Info & Action Section ---
          Expanded(
            child: Padding(
              // Adjusted padding since the SizedBox handles the left spacing now
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, right: 16.0),
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
                    'Saudi German', 
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
          ),
        ],
      ),
    );
  }
}
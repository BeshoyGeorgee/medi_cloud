import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/app_images.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/custom_outline_button.dart';


class RecomndHospitalCard extends StatelessWidget {
  const RecomndHospitalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Fixed width so horizontal scrolling looks consistent
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppDecorations.borderRadius25,
        boxShadow: [AppDecorations.defaultShadow],
      ),
      child: Row(
        children: [
          // --- Hospital Logo Section ---
          ClipRRect(
            borderRadius: BorderRadius.circular(16), // Smooth rounded corners for the logo
            child: Image.asset(
              Assets.imagesSaudiGerman, // Your newly added hospital asset
              width: 80,  // Fixed width for consistent alignment
              height: 80, // Fixed height to balance with the text column
              fit: BoxFit.contain, // 'contain' is usually better for logos so they don't get cropped, but you can change to 'cover' if it's a photo
            ),
          ),
    
          const SizedBox(width: 16),

          // --- Hospital Info & Action Section ---
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Hospital Name
                Text(
                  'Saudi German',
                  style: Styles.textStyle18Bold.copyWith(color: kShadePrimaryColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis, // To prevent overflow if name is long
                ),
                const SizedBox(height: 4),
                // Location
                Text(
                  'New Nozha, Cairo',
                  style: Styles.textStyle14.copyWith(color: kGreyColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                // Join Button
                SizedBox(
                  height: 35, // Small height for the inside card button
                  width: 100,
                  child: CustomOutlinedButton(
                    text: 'Join',
                    onPressed: () {
                      debugPrint('Join Saudi German Hospital');
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
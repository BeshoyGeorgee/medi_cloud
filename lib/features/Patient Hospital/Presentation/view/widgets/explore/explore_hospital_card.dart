import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/app_images.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

class ExploreHospitalCard extends StatelessWidget {
  final VoidCallback onTap;

  const ExploreHospitalCard({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          AppDecorations.bottomBarShadow,
        ],
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Hospital Image/Logo Section ---
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  // Optional: You can wrap Image.asset with Padding if the logo is too close to the edges
                  child: Image.asset(
                    Assets.imagesSaudiGerman, // تأكد إن ده اسم المتغير بتاع لوجو المستشفى عندك
                    width: double.infinity,
                    // contain is usually better for logos so they don't get cropped
                    // If it's a photo of the building, you can change it back to BoxFit.cover
                    fit: BoxFit.contain, 
                  ),
                ),
              ),
              
              // --- Hospital Details Section ---
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Saudi German',
                      style: Styles.textStyle16Bold.copyWith(color: Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'New Nozha, Cairo',
                      style: Styles.textStyle14.copyWith(color: kGreyColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
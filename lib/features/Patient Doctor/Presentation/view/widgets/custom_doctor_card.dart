import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/app_images.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

class CustomDoctorCard extends StatelessWidget {
  // 1. Added onTap variable to be passed from outside
  final VoidCallback onTap; 

  const CustomDoctorCard({
    super.key, 
    required this.onTap, // Make it required
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Keep shadow on the outermost container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          AppDecorations.bottomBarShadow, 
        ],
      ),
      // 2. Used Material and InkWell for a smooth tap ripple effect
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap, // 3. Assigning the passed function here
          borderRadius: BorderRadius.circular(16), // Match border radius for the ripple
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Doctor Image Section ---
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    Assets.imagesDoctorCard, 
                    width: double.infinity,
                    fit: BoxFit.cover, 
                  ),
                ),
              ),
              
              // --- Doctor Details Section ---
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dr. Warren',
                      style: Styles.textStyle16Bold.copyWith(color: Colors.black),
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
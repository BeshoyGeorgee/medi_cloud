import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

class MyDocHosCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const MyDocHosCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // InkWell is used to make the card clickable with a Material ripple effect
    return InkWell(
      onTap: onTap,
      // Match the border radius to keep the ripple effect inside the card
      borderRadius: AppDecorations.borderRadius25, 
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppDecorations.borderRadius25,
          boxShadow: [AppDecorations.defaultShadow],
        ),
        child: Row(
          children: [
            // --- Image Section (Doctor or Hospital) ---
            ClipRRect(
              borderRadius: BorderRadius.circular(15), // Slightly rounded image
              child: Image.network(
                imageUrl,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                // Fallback icon in case the image fails to load
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                  width: 70,
                  height: 70,
                  child: Icon(Icons.broken_image, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(width: 15),
            
            // --- Information Section ---
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title (Name of doctor or hospital)
                  Text(
                    title,
                    style: Styles.textStyle18Bold.copyWith(color: Colors.black87),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  // Subtitle (Specialty or Location)
                  Text(
                    subtitle,
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
    );
  }
}
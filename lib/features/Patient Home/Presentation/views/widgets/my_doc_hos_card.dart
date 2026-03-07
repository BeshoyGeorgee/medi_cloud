import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

class MyDocHosCard extends StatelessWidget {
  final String imageAsset; 
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const MyDocHosCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppDecorations.borderRadius25,
        boxShadow: [AppDecorations.defaultShadow],
      ),
      child: Material(
        color: Colors.white,
        borderRadius: AppDecorations.borderRadius25,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppDecorations.borderRadius25,
          child: Padding(
            padding: const EdgeInsets.all(16.0), 
            child: Row(
              children: [
                // --- Image Section ---
                ClipRRect(
                  borderRadius: BorderRadius.circular(12), 
                  child: Image.asset(
                    imageAsset,
                    // Increased width and height to make the image properly fill its space
                    width: 85, 
                    height: 85,
                    fit: BoxFit.cover,
                  ),
                ),
                
                const SizedBox(width: 16),
                
                // --- Information Section ---
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: Styles.textStyle18Bold.copyWith(color: const Color(0xff363853)), 
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
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
        ),
      ),
    );
  }
}
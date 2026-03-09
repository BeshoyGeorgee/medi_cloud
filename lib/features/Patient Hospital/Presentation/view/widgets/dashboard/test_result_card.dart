import 'package:flutter/material.dart';
import 'package:medi_cloud_app/constant.dart'; // مسار ملف الثوابت

class TestResultCard extends StatelessWidget {
  final String tagText;
  final Color tagColor;
  final String title;
  final String labName;
  final String doctorName;
  final String date;
  final String iconAsset;
  final VoidCallback onTap;

  const TestResultCard({
    super.key,
    required this.tagText,
    required this.tagColor,
    required this.title,
    required this.labName,
    required this.doctorName,
    required this.date,
    required this.iconAsset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          // Used the shared border radius for medium cards
          borderRadius: AppDecorations.borderRadius16, 
          border: Border.all(color: Colors.grey.shade200),
          // Used the shared default shadow!
          boxShadow: [AppDecorations.defaultShadow], 
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Left Side: Icon Container ---
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                // Used the shared light container color
                color: kLightContainerColor, 
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                iconAsset,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.science, 
                  color: kPrimaryColor, // Used Primary Color as fallback
                ),
              ),
            ),
            
            const SizedBox(width: 16),
            
            // --- Right Side: Details ---
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Tag Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: tagColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      tagText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // 2. Title
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      // Used the shared dark text color
                      color: kDarkTextColor, 
                    ),
                  ),
                  
                  const SizedBox(height: 6),
                  
                  // 3. Lab Name Row
                  Row(
                    children: [
                      // Used kGreyColor
                      const Icon(Icons.biotech_outlined, size: 16, color: kGreyColor),
                      const SizedBox(width: 6),
                      Text(
                        labName,
                        style: const TextStyle(fontSize: 13, color: kGreyColor),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 4),
                  
                  // 4. Doctor Name & Date Row
                  Row(
                    children: [
                      // Used kGreyColor
                      const Icon(Icons.medical_services_outlined, size: 16, color: kGreyColor),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          doctorName,
                          style: const TextStyle(fontSize: 13, color: kGreyColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Date aligned to the right
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 12, 
                          color: kGreyColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
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
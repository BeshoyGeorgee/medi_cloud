import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

class HeartRateCard extends StatelessWidget {
  const HeartRateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        // Apply the primary gradient background
        gradient: const LinearGradient(
          colors: [kPrimaryColor, kShadePrimaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        // Apply the unified border radius from the design system
        borderRadius: AppDecorations.borderRadius25,
      ),
      child: Stack(
        children: [
          // Background decorative icon (Heart rate wave)
          Positioned(
            top: 24,
            right: 24,
            bottom: 20,
            child: Icon(Icons.show_chart, size: 140, color: kWhiteOpacity20),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Top Section: Last Update & Arrow ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // FIX: This line pushes the arrow up to align with the top text
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last update',
                          style: Styles.textStyle12.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ), // Spacing between the two texts
                        Text(
                          '41 min ago',
                          style: Styles.textStyle14.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    // Navigation Arrow Buttonل
                    Container(
                      padding: const EdgeInsets.all(8),
                      // Added 'const' and used the unified constant color for better performance
                      decoration: const BoxDecoration(
                        color: kWhiteOpacity20,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ],
                ),

                const Spacer(flex: 3),

                // --- Bottom Section: Heart Rate Value & Status ---
                Text(
                  'Heart Rate',
                  style: Styles.textStyle16.copyWith(color: Colors.white70),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '65',
                      style: Styles.textStyle45Bold.copyWith(
                        color: Colors.white,
                        height: 0.9,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'bpm',
                      style: Styles.textStyle20.copyWith(color: Colors.white),
                    ),
                    const Spacer(),
                    Text(
                      'Normal',
                      style: Styles.textStyle18.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

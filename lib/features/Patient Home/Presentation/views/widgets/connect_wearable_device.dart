import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/app_images.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_button.dart';
import 'package:medi_cloud_app/constant.dart';

class ConnectWerableDevice extends StatelessWidget {
  const ConnectWerableDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppDecorations.borderRadius25, 
        boxShadow: [AppDecorations.defaultShadow], 
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // --- Text Section ---
              // Text will take all available remaining space safely
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Connect to\nWerable Device',
                      style: Styles.textStyle22Bold.copyWith(
                        color: kShadePrimaryColor,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Sync all health data in one Place. Apple Watch and Powerbeats Pro 2 supported',
                      style: Styles.textStyle14.copyWith(
                        color: kLightPrimaryColor,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(width: 16),
              
              // --- Image Section ---
              // Removed Expanded to prevent it from being constrained by the text height.
              // Used Transform.scale to visually enlarge the watch without breaking the layout constraints.
              Transform.scale(
                scale: 1.4, // This scales the image up by 40%. You can increase it to 1.5 or 1.6 if needed!
                child: Image.asset(
                  Assets.imagesSmartWatch,
                  // Base dimensions for the image placeholder
                  width: 100, 
                  height: 100,
                  fit: BoxFit.contain, 
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // --- Action Button ---
          CustomButton(
            text: 'Connect',
            onPressed: () {
              debugPrint('Connect Button Pressed!');
            },
          ),
        ],
      ),
    );
  }
}
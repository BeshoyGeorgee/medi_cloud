import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

class CustomSuccessCard extends StatelessWidget {
  // Dynamic message to be passed when using this widget
  final String message;

  const CustomSuccessCard({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // Generous padding inside the card to match the design
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppDecorations.borderRadius25, // Your unified border radius
        boxShadow: [AppDecorations.defaultShadow],   // Your unified shadow
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Shrink column to fit its children
        children: [
          // --- Green Checkmark Icon ---
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              // The bright green color for success
              color: Color(0xFF1AA34A), 
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 50,
            ),
          ),
          
          const SizedBox(height: 24),
          
          // --- Dynamic Text Message ---
          Text(
            message,
            textAlign: TextAlign.center,
            style: Styles.textStyle18Bold.copyWith(
              color: kPrimaryColor,
              height: 1.5, // Line height for better readability
            ),
          ),
        ],
      ),
    );
  }
}
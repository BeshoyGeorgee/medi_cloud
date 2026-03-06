import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

class CustomStopFollowUpDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final String cancelBtnText;
  final String confirmBtnText;
  final VoidCallback onConfirm;

  const CustomStopFollowUpDialog({
    super.key,
    required this.title,
    required this.subtitle,
    // Default values if you don't pass them, but you can override them for hospitals or other actions
    this.cancelBtnText = 'Keep Follow-up',
    this.confirmBtnText = 'Stop Follow-up',
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min, // Shrink to fit content
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // --- Content Section ---
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Styles.textStyle18Bold.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 12),
                Text(
                  subtitle,
                  style: Styles.textStyle14.copyWith(color: Colors.black87, height: 1.4),
                ),
              ],
            ),
          ),
          
          const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)), 
          
          // --- Action Buttons Section ---
          Row(
            children: [
              // Cancel / Keep Button (Left)
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close dialog without doing anything
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16)),
                    ),
                  ),
                  child: Text(
                    cancelBtnText,
                    style: Styles.textStyle16Bold.copyWith(color: kPrimaryColor),
                  ),
                ),
              ),
              
              Container(width: 1, height: 50, color: const Color(0xFFEEEEEE)),
              
              // Confirm / Stop Button (Right)
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                    onConfirm(); // Execute the action (e.g., unfollow)
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(16)),
                    ),
                  ),
                  child: Text(
                    confirmBtnText,
                    style: Styles.textStyle16Bold.copyWith(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
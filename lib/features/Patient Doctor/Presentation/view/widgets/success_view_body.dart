import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_button.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_success_card.dart'; // Import the new card

class SuccessViewBody extends StatelessWidget {
  const SuccessViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Padding on the sides to center the card nicely
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center everything vertically
        children: [
          // --- 1. The Reusable Success Card ---
          const CustomSuccessCard(
            // Passing the specific message for this screen
            message: 'Your request has been\nsuccessfully',
          ),
          
          const SizedBox(height: 40),
          
          // --- 2. Back to Home Button ---
          // Wrapped in a SizedBox to make the button width smaller than the card (matching the design)
          SizedBox(
            width: 200, 
            child: CustomButton(
              text: 'Back to Home',
              onPressed: () {
               GoRouter.of(context).push(AppRouter.kPatientMainScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'custom_doctor_card.dart';

class CustomDoctorGrid extends StatelessWidget {
  const CustomDoctorGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // Added bottom padding to prevent the last items from being clipped by the screen edge
      padding: const EdgeInsets.only(bottom: 24),
      // Smooth scrolling effect (iOS style)
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns in the grid
        crossAxisSpacing: 16, // Horizontal spacing between cards
        mainAxisSpacing: 16, // Vertical spacing between cards
        childAspectRatio:
            0.75, // Adjust this value if you face bottom overflow issues in the card
      ),
      itemCount: 6, // Mock item count
      itemBuilder: (context, index) {
        return  CustomDoctorCard(
          onTap:(){
            GoRouter.of(context).push(AppRouter.kDoctorDetailsView);
          },
        );
      },
    );
  }
}

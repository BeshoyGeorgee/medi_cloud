import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'explore_hospital_card.dart'; 

class ExploreHospitalsGrid extends StatelessWidget {
  const ExploreHospitalsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.only(top: 16),
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          crossAxisSpacing: 16, 
          mainAxisSpacing: 16,  
          childAspectRatio: 0.85, 
        ),
        itemCount: 4, 
        itemBuilder: (context, index) {
          return ExploreHospitalCard(
            onTap: () {
              // الانتقال لشاشة تفاصيل المستشفى
              GoRouter.of(context).push(AppRouter.kHospitalDetailsView);
            },
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_images.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';


class HospitalDetailsHeader extends StatelessWidget {
  const HospitalDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // --- 1. Background Image ---
        Image.asset(
          Assets.imagesSaudiGerman,  
          width: double.infinity,
          height: 320, // ارتفاع الهيدر
          fit: BoxFit.cover,
        ),
        
        // --- 2. Black Gradient Overlay ---
        Container(
          height: 320,
          decoration: BoxDecoration(
            gradient:LinearGradient(
            colors: [
              Colors.transparent,
              Colors.black.withAlpha(204), // 204 = 80% Opacity
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          ),
        ),
        
        // --- 3. Back Button ---
        Positioned(
          top: 0,
          left: 0,
          child: SafeArea(
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
              onPressed: () => GoRouter.of(context).pop(),
            ),
          ),
        ),
        
        // --- 4. Hospital Name & Location ---
        Positioned(
          bottom: 24,
          left: 24,
          right: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Saudi German',
                style: Styles.textStyle22Bold.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 4),
              Text(
                'New Nozha, Cairo',
                style: Styles.textStyle14.copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
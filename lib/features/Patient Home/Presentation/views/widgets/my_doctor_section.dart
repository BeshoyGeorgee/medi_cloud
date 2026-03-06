import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/app_images.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';
import 'my_doc_hos_card.dart';


class MyDoctorSection extends StatelessWidget {
  const MyDoctorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- Section Title ---
        Text(
          'My Doctors',
          style: Styles.textStyle22Bold.copyWith(color: kShadePrimaryColor),
        ),
        const SizedBox(height: 15),
        
        // --- Vertical List of Doctors ---
        ListView.separated(
          // MUST BE TRUE: allows the ListView to size itself inside a ScrollView
          shrinkWrap: true, 
          // Prevents inner scrolling, lets the parent SingleChildScrollView handle scrolling
          physics: const NeverScrollableScrollPhysics(), 
          itemCount: 2, // Mock count based on the design
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemBuilder: (context, index) {
            return MyDocHosCard(
              // 2. CHANGED: Using imageAsset with the local image variable
              // Make sure to replace 'Assets.imagesDocCard2' with the correct icon/image variable from your assets file
              imageAsset: Assets.imagesDoctorCard, 
              title: 'Dr. Jenny Wilson',
              subtitle: 'Neurologist | Vcare Clinic',
              onTap: () {
                debugPrint('Doctor card clicked: $index');
              },
            );
          },
        ),
      ],
    );
  }
}
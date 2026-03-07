import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // ضفنا البلوك
import 'package:medi_cloud_app/Core/utils/app_images.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Hospital/Data/hospital_details_cubit.dart';


class HospitalLocationSection extends StatelessWidget {
  const HospitalLocationSection({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location',
            style: Styles.textStyle16Bold.copyWith(color: Colors.black87),
          ),
          const SizedBox(height: 16),
          
          // --- Map Image with Tap Action ---
          InkWell(
            onTap: () {
              // هنا الـ UI بيدي الأوردر للكيوبت وهو بيتصرف
              context.read<HospitalDetailsCubit>().openGoogleMaps(
                'https://maps.app.goo.gl/8gnbL4CpDXLgL7wD6' // اللينك هيتغير بعدين للينك الحقيقي
              );
            },
            borderRadius: BorderRadius.circular(16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                Assets.imagesSaudiGermanMap, // اسم المتغير الجديد
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover, // ده بيخلي الصورة تملأ المكان بشكل شيك من غير ما تتمد
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_images.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';
import 'my_doc_hos_card.dart';

class MyHospitalSection extends StatelessWidget {
  const MyHospitalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Text(
          'My Hospital',
          style: Styles.textStyle22Bold.copyWith(color: kShadePrimaryColor),
        ),
        const SizedBox(height: 15),

        // --- Single Hospital Card ---
        MyDocHosCard(
          imageAsset: Assets.imagesSaudiGerman,
          title: 'Saudi German',
          subtitle: 'New Nozha, Cairo, Egypt.',
          onTap: () {
            GoRouter.of(context).push(AppRouter.kMyHospitalDashboardView);
          },
        ),
      ],
    );
  }
}

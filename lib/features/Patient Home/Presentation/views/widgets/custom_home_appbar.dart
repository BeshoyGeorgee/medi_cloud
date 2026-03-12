import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/Core/utils/widgets/patient_main_screen.dart';
import 'package:medi_cloud_app/constant.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            PatientMainScreen.scaffoldKey.currentState!.openDrawer();
          },
          child: const Icon(Icons.menu, size: 32, color: kShadePrimaryColor),
        ),
        const SizedBox(width: 15),
        const CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage(
            'https://randomuser.me/api/portraits/men/32.jpg',
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello,',
              style: Styles.textStyle14.copyWith(color: kGreyColor),
            ),
            Text(
              'Mr James',
              style: Styles.textStyle18Bold.copyWith(color: kShadePrimaryColor),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kNotificationView);
          },
          child: Stack(
            children: [
              const Icon(
                Icons.notifications_none_rounded,
                size: 32,
                color: kShadePrimaryColor,
              ),
              Positioned(
                right: 4,
                top: 2,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

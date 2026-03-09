import 'package:flutter/material.dart';

import 'package:medi_cloud_app/Core/utils/app_images.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/drawer_footer.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/drawer_header.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double drawerWidth = MediaQuery.of(context).size.width * 0.9;
    return Drawer(
      width: drawerWidth,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      backgroundColor: const Color(
        0xffF1F8F8,
      ), // لون الخلفية الهادي اللي في الصورة
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header: Profile Info
          drawerHeader(),

          const SizedBox(height: 20),

          // 2. Menu Items
          Expanded(
            child: ListView(
              children: [
                drawerItem(
                  icon: Icons.person_outline,
                  title: 'Profile',
                  onTap: () {},
                ),
                drawerItem(
                  imagePath:
                      Assets.imagesIncurance, // استخدمت الـ Assets اللي بعتها
                  title: 'Insurance',
                  onTap: () {},
                ),
                drawerItem(
                  imagePath: Assets.imagesMinistryOfHealth,
                  title: 'Ministry of Health',
                  onTap: () {},
                ),
                drawerItem(
                  imagePath: Assets.imagesWHO,
                  title: 'World Health Organization',
                  onTap: () {},
                ),
              ],
            ),
          ),

          // 3. Footer: Settings & Log out
          drawerFooter(),
        ],
      ),
    );
  }
}

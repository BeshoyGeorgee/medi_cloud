import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

class CustomAuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? iconColor; // الميزة بتاعتك
  final VoidCallback? onBack; // الميزة اللي جاية من المين

  const CustomAuthAppBar({
    super.key,
    required this.title,
    this.iconColor,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          // لو باعتين لون هنستخدمه، لو لأ هنستخدم اللون الديفولت
          color: iconColor ?? const Color(0xff363853), 
          size: 32,
        ),
        // لو باعتين أكشن هنشغله، لو لأ هيعمل pop عادي
        onPressed: onBack ?? () => Navigator.pop(context),
      ),
      title: Text(
        title,
        style: Styles.textStyle24Bold.copyWith(color: kPrimaryColor),
      ),
    );
  }

  // السطر ده مهم عشان إنت عامل implements PreferredSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); 
}




class CustomAppBar extends StatelessWidget {
  final String title;
  final Color? iconColor;
  final Color? textColor; // 1. ضفنا المتغير بتاع لون الكلمة

  const CustomAppBar({
    super.key,
    required this.title,
    this.iconColor,
    this.textColor, // 2. خليناه اختياري
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new, 
                  color: iconColor ?? const Color(0xff363853),
                  size: 24,
                ),
                onPressed: () {
                  GoRouter.of(context).pop(); 
                },
              ),
            ),
            
            Text(
              title,
              // 3. هنا الـ Logic: لو باعت لون للكلمة استخدمه، لو لأ حط اللون الأخضر الأساسي
              style: Styles.textStyle24Bold.copyWith(
                color: textColor ?? kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
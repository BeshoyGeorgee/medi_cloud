import 'package:flutter/material.dart';
import 'package:medi_cloud_app/constant.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText; // المتغير اللي هيستقبل الجملة
  final void Function(String)? onChanged; // ضفتهولك عشان لو حبيت تعمل فلترة بعدين

  const CustomSearchBar({
    super.key,
    required this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // ضفنا Container عشان نعمل Shadow خفيف زي الديزاين الاحترافي
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          AppDecorations.bottomBarShadow,
        ]
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText, // الجملة المتغيرة
          hintStyle: const TextStyle(color: kGreyColor, fontSize: 14),
          prefixIcon: const Icon(Icons.search, color: kGreyColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none, // شيلنا الخط اللي بيظهر الديفولت
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}
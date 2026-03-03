
import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';
// ويدجت مخصصة للـ Checkbox عشان تطلع زي الديزاين

class HealthConditionTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final ValueChanged<bool> onChanged;

  const HealthConditionTile({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isSelected),
      child: Container(
        height: 60, // ارتفاع الحقل ليناسب الديزاين
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          // لون الخلفية أبيض أو شفاف في حالة الـ Unselected
          color: isSelected ? kPrimaryColor : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(
            20,
          ), // Border Radius دائري كما في الصورة
          border: Border.all(
            // لون الـ Border الرفيع الأخضر
            color: kPrimaryColor.withOpacity(0.6),
            width: 1.2,
          ),
        ),
        child: Row(
          children: [
            // المربع (Checkbox) اليدوي ليطابق الصورة تماماً
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      isSelected
                          ? Colors.white
                          : kPrimaryColor.withOpacity(0.6),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(4),
                color: isSelected ? Colors.white : Colors.transparent,
              ),
              child:
                  isSelected
                      ? const Icon(Icons.check, size: 20, color: Colors.black)
                      : null,
            ),
            const SizedBox(width: 16),
            // نص الحالة الصحية
            Text(
              title,
              style: Styles.textStyle18.copyWith(
                color: isSelected ? Colors.white : kPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
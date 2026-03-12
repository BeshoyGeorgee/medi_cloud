import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';

class CustomTabItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;

  const CustomTabItem({
    super.key,
    required this.text,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffd1e3e0) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey.shade300,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected) ...[
              Icon(icon, size: 16, color: const Color(0xff4A4459)),
              const SizedBox(width: 4),
            ],
            Flexible( 
      child: Text(
        text,
        textAlign: TextAlign.center, // عشان الكلام الطويل يتوسطن
        maxLines: 1, // لو عايزه في سطر واحد ويصغر
        overflow: TextOverflow.ellipsis, // لو الكلام زاد أوي يحط نقط ...
        style: Styles.textStyle16Medium.copyWith(
          color: const Color(0xff4A4459),
          fontSize: 16, // صغر الفونت شوية عشان الـ Guidelines طويلة
        ),
      ),
    ),
          ],
        ),
      ),
    );
  }
}
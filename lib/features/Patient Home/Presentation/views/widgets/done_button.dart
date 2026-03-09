import 'package:flutter/material.dart';

import 'package:medi_cloud_app/constant.dart';

class DoneButton extends StatelessWidget {
  final VoidCallback onTap; // ده "الأمر" اللي هيتنفذ لما ندوس
  const DoneButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140, // الزرار في الصورة واخد عرض محدد مش full width
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,

        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          "Done",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

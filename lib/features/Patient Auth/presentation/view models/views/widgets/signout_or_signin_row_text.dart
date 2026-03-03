import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

class SignUpOrSignInRowText extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback? onTap; // 1. أضفنا المتغير ده هنا

  const SignUpOrSignInRowText({
    super.key,
    required this.text,
    required this.actionText,
    this.onTap, // 2. أضفناه في الـ Constructor
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Styles.textStyle14.copyWith(
            color: const Color(0xff070707),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: onTap, // 3. نستخدم الـ onTap اللي جاي من بره
          child: Text(
            actionText,
            style: Styles.textStyle14.copyWith(
              color: kPrimaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
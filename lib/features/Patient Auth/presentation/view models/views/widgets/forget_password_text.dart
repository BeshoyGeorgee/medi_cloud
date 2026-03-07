import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {}, // Logic لاحقاً
        child: Text(
          "Forget Password?",
          style: Styles.textStyle12.copyWith(
            color: kPrimaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

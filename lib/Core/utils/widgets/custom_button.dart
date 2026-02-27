import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart'; 
import 'package:medi_cloud_app/constant.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor, // Optional: override default background color
    this.textColor,       // Optional: override default text color
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // Fixed height to maintain consistency across all app buttons
      height: 55, 
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          // Fallback to kSecondaryColor if no custom background color is provided
          backgroundColor: backgroundColor ?? kPrimaryColor, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: Styles.textStyle18Bold.copyWith(
            // Fallback to white if no custom text color is provided
            color: textColor ?? Colors.white, 
          ),
        ),
      ),
    );
  }
}
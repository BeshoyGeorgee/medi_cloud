import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';

//Custom button widget to be used in the role selection view or(in the whole the app)

class CustomeButton extends StatelessWidget {
  const CustomeButton({
    super.key,
    required this.theme,
    required this.text,
    required this.color,
  });

  //initialize the variables to be used in the widget
  final ThemeData theme;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      width: 191,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: Styles.textStyle20Bold.copyWith(color: Colors.white),
      ),
    );
  }
}

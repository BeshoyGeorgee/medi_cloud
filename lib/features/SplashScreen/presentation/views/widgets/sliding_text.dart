import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

class Slidingtext extends StatelessWidget {
  const Slidingtext({super.key, required this.SlidingAnimation});

  //variable for the sliding animation
  final Animation<Offset> SlidingAnimation;

  @override
  Widget build(BuildContext context) {
    //we use animate builder to build this widget only and to reduce space from memory and to improve the performance of the app
    return AnimatedBuilder(
      //Use the sliding animation to animate the text when the splash screen is displayed
      animation: SlidingAnimation,
      builder:
          (context, child) => SlideTransition(
            position: SlidingAnimation,
            child: Text(
              "MediCloud",
              textAlign: TextAlign.center,
              style: Styles.textStyle36Bold.copyWith(
                color: kSecondaryColor,
                fontSize: 36,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomHorizontalListView extends StatelessWidget {
  final double height;
  final int itemCount;
  final Widget itemWidget;

  const CustomHorizontalListView({
    super.key,
    required this.height,
    required this.itemCount,
    required this.itemWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Dynamic height based on the passed parameter
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        // Native bouncing effect for better user experience
        physics: const BouncingScrollPhysics(),
        itemCount: itemCount,
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        // Renders the widget passed through the constructor (e.g., HospitalCard or DoctorCard)
        itemBuilder: (context, index) {
          return itemWidget;
        },
      ),
    );
  }
}
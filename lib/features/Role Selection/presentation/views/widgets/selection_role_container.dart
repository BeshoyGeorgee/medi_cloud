import 'package:flutter/material.dart';


//Widget to display the selection role container

class SelectionRoleContainer extends StatelessWidget {
  //initialize the image path variable to be used in the widget
  final String imagePath;
  const SelectionRoleContainer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          width: 240,
          height: 170,
          child: Image.asset(imagePath, fit: BoxFit.fill),
        ),
      ),
    );
  }
}

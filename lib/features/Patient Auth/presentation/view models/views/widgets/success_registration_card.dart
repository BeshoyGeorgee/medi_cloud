import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';

class SucessRegistrationCard extends StatelessWidget {
  const SucessRegistrationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xff0FB33B),
            child: Icon(Icons.check, color: Colors.white, size: 60),
          ),
          const SizedBox(height: 30),
          Text(
            "Your account\nwas successfully created!",
            textAlign: TextAlign.center,
            style: Styles.textStyle20.copyWith(
              color: const Color(0xff0D1B34),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

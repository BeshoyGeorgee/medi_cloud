import 'package:flutter/material.dart';
import 'package:medi_cloud_app/constant.dart';

class CarePlanTab extends StatelessWidget {
  const CarePlanTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent, 
      
      // --- حالة عدم وجود تقارير (Empty State) ---
      body: const Center(
        child: Text(
          'No Plans',
          style: TextStyle(
            fontSize: 16,
            color: kGreyColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      
   
    );
  }
}
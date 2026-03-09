import 'package:flutter/material.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart'; // مسار الـ AppBar بتاعك
// استدعي ملف الـ Body
import 'widgets/my_hospital_dashboard_body.dart'; 

class MyHospitalDashboardView extends StatelessWidget {
  const MyHospitalDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      // حطينا الـ AppBar هنا عشان يفضل ثابت والتابات هي اللي تتغير تحته
      appBar: const CustomAuthAppBar(
        title: 'My Hospital',
      ),
      body: const MyHospitalDashboardBody(),
    );
  }
}
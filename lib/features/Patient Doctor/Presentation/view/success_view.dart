import 'package:flutter/material.dart';
import 'package:medi_cloud_app/features/Patient%20Doctor/Presentation/view/widgets/success_view_body.dart';

class SuccessDocComfView extends StatelessWidget {
  const SuccessDocComfView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // Optional: If the design background is slightly grey, you can add backgroundColor here
      // backgroundColor: Color(0xFFF5F5F5), 
      
      // Using SafeArea ensures the content doesn't overlap with the device's status bar
      body: SafeArea(
        child: SuccessViewBody(),
      ),
    );
  }
}
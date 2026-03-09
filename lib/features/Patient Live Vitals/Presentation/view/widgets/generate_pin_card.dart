import 'package:flutter/material.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_button.dart';

class GeneratePinCard extends StatelessWidget {
  const GeneratePinCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppDecorations.borderRadius25,
        boxShadow: [AppDecorations.defaultShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Generate Your\nSecurity PIN',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: kShadePrimaryColor,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "You'll need this PIN to access your health data\nand to share it with doctors",
            style: TextStyle(fontSize: 13, color: kLightPrimaryColor, height: 1.4),
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: 'Generate PIN',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
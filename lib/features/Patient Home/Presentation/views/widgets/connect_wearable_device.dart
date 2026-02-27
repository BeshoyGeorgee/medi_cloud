import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_button.dart';
import 'package:medi_cloud_app/constant.dart';

class ConnectWerableDevice extends StatelessWidget {
  const ConnectWerableDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppDecorations.borderRadius25, // استخدام البوردر الموحد
        boxShadow: [AppDecorations.defaultShadow], // استخدام الشادو الموحد
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Connect to\nWerable Device',
                      style: Styles.textStyle22Bold.copyWith(
                        color: kShadePrimaryColor,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Sync all health data in one Place. Apple Watch and Powerbeats Pro 2 supported',
                      style: Styles.textStyle14.copyWith(
                        color: kLightPrimaryColor,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Image.network(
                  'https://ouch-cdn2.icons8.com/mO_p9-8y9E-kYq1Xz1Xz1Xz1Xz1Xz1Xz1Xz1Xz1Xz1Xz.png',
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          // --- Action Button (Using our Reusable CustomButton) ---
          CustomButton(
            text: 'Connect',
            onPressed: () {
              debugPrint('Connect Button Pressed!');
            },
          ),
        ],
      ),
    );
  }
}

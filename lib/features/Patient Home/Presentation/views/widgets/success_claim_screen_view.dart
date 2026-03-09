import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_success_card.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/done_button.dart';

class SuccessClaimScreenView extends StatelessWidget {
  final VoidCallback onDone; // الأمر اللي هيتبعت من الصفحة اللي قبلها
  const SuccessClaimScreenView({super.key, required this.onDone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: "Make Claim"),
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Center(
              child: CustomSuccessCard(
                message: "Your request has been successfully registered",
                color: Colors.black,
                iconHeight: 100,
                iconWidth: 100,
                iconSize: 80,
                verticalPadding: 70,
                FontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 36),
          DoneButton(onTap: onDone,),
        ],
      ),
    );
  }
}

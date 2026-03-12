import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Live%20Vitals/Presentation/view/widgets/security_pin_view_body.dart';

class SecurityPinView extends StatelessWidget {
  final String pinCode;
  const SecurityPinView({super.key, required this.pinCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kDarkTextColor),
          onPressed: () {
            GoRouter.of(context).pop(); // نرجع للشاشة اللي فاتت
          },
        ),
      ),
      body: SecurityPinViewBody(pinCode: pinCode),
    );
  }
}
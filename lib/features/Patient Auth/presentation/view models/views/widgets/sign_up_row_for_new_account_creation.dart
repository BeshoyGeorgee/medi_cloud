import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_textfield.dart';

class SignUpRowInputForNewAccountCreation extends StatelessWidget {
  final String Label1;
  final String hintText1;
  final String Label2;
  final String hintText2;
  final bool isPassword; // خليناها bool عادية طالما فيه قيمة افتراضية
  final Function(String)? onChanged1;
  final Function(String)? onChanged2;
  final String? Function(String?)? validator1;
  final String? Function(String?)? validator2;
  // ضفنا الكنترولرز هنا
  final TextEditingController? controller1;
  final TextEditingController? controller2;

  const SignUpRowInputForNewAccountCreation({
    super.key,
    required this.Label1,
    required this.hintText1,
    required this.Label2,
    required this.hintText2,
    this.isPassword = false, // القيمة الافتراضية
    this.onChanged1,
    this.onChanged2,
    required this.validator1,
    required this.validator2,
    this.controller1,
    this.controller2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          // يفضل استخدام Expanded بدل width ثابت عشان الـ Responsive
          child: CustomLabeledTextField(
            validator: validator1,
            controller: controller1,
            label: Label1,
            hintText: hintText1,
            // اتأكد إن الاسم جوه الـ Widget دي isPassword مش obscureText
            isPassword: isPassword,
            onChanged: onChanged1,
          ),
        ),
        const SizedBox(width: 15), // مسافة ثابتة بين الحقلين
        Expanded(
          child: CustomLabeledTextField(
            validator: validator2,
            label: Label2,
            controller: controller2,
            hintText: hintText2,
            isPassword: isPassword,
            onChanged: onChanged2,
          ),
        ),
      ],
    );
  }
}

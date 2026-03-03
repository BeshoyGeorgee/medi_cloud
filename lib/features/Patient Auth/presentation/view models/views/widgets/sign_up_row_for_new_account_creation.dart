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

  const SignUpRowInputForNewAccountCreation({
    super.key,
    required this.Label1,
    required this.hintText1,
    required this.Label2,
    required this.hintText2,
    this.isPassword = false, // القيمة الافتراضية
    this.onChanged1,
    this.onChanged2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded( // يفضل استخدام Expanded بدل width ثابت عشان الـ Responsive
          child: CustomLabeledTextField(
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
            label: Label2,
            hintText: hintText2,
            isPassword: isPassword,
            onChanged: onChanged2,
          ),
        ),
      ],
    );
  }
}
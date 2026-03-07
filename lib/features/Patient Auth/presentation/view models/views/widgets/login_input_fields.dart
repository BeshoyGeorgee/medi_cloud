import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_textfield.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/cubit/patient_auth_cubit.dart';

class LoginInputFields extends StatelessWidget {
  final PatientAuthCubit authCubit;
  const LoginInputFields({super.key, required this.authCubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomLabeledTextField(
          controller: authCubit.emailController,
          label: "Email",
          hintText: "example@gmail.com",
          keyboardType: TextInputType.emailAddress,
          validator: (val) {
            if (val == null || val.isEmpty) return "Enter your email";
            final gmailRegex = RegExp(r'^[\w-\.]+@gmail\.com$');
            if (!gmailRegex.hasMatch(val.trim())) return 'Enter a valid @gmail.com address';
            return null;
          },
        ),
        const SizedBox(height: 18),
        CustomLabeledTextField(
          controller: authCubit.passwordController,
          label: "Password",
          hintText: "************",
          isPassword: true,
          validator: (val) {
            if (val == null || val.isEmpty) return "Enter your password";
            if (val.length < 8) return "Password must be at least 8 characters";
            return null;
          },
        ),
      ],
    );
  }
}
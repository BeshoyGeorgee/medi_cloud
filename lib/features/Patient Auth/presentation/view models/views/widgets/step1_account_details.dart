import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_button.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_textfield.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/cubit/patient_auth_cubit.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/custome_phone_field.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/sign_up_row_for_new_account_creation.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/signout_or_signin_row_text.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/title_text.dart';

class Step1AccountDetails extends StatelessWidget {
  final VoidCallback onNext;
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  const Step1AccountDetails({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<PatientAuthCubit>();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TitleText(text: "Create Account"),
            const SizedBox(height: 10),
            
            SignUpRowInputForNewAccountCreation(
              // نربط الكنترولرز عشان البيانات تفضل ثابتة
              controller1: authCubit.firstNameController,
              controller2: authCubit.lastNameController,
              Label1: "First Name",
              hintText1: "First Name",
              validator1: (val) => val == null || val.isEmpty ? "Enter your first name" : null,
              Label2: "Last Name",
              hintText2: "Last Name",
              validator2: (val) => val == null || val.isEmpty ? "Enter your last name" : null,
            ),
            
            const SizedBox(height: 12),
            
            CustomLabeledTextField(
              label: "Email",
              hintText: "example@gmail.com",
              controller: authCubit.emailController, // استخدام الكنترولر من الكيوبيت
              validator: (val) {
                if (val == null || val.isEmpty) return "Enter your email";
                final gmailRegex = RegExp(r'^[\w-\.]+@gmail\.com$');
                if (!gmailRegex.hasMatch(val.trim())) {
                  return 'Please enter a valid @gmail.com address';
                }
                return null;
              },
            ),
            
            const SizedBox(height: 18),
            
            CustomPhoneField(
              title: "Phone Number",
              controller: authCubit.phoneController, // ربط الموبايل بالكنترولر
            ),
            
            const SizedBox(height: 18),
            
            SignUpRowInputForNewAccountCreation(
              controller1: authCubit.passwordController,
              controller2: authCubit.confirmPasswordController,
              isPassword: true,
              Label1: "Password",
              hintText1: "password",
              validator1: (val) => (val?.length ?? 0) < 8 ? "At least 8 chars" : null,
              Label2: "Confirm Password",
              hintText2: "confirm password",
              validator2: (val) {
                if (val != authCubit.passwordController.text) return "Doesn't match";
                return null;
              },
            ),
            
            const SizedBox(height: 40),
            
            Center(
              child: CustomButton(
                text: "Continue",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print("Step 1 Validated - Moving to Step 2");
                    onNext();
                  }
                },
                width: 190,
              ),
            ),
            const SizedBox(height: 20),
            const SignUpOrSignInRowText(
              text: "Already have an account?",
              actionText: "Login",
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
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
  //Make Form Key for validation
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  const Step1AccountDetails({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    // عرفنا الـ Cubit في متغير عشان الكود يبقى أنضف وأسهل في القراءة
    final authCubit = context.read<PatientAuthCubit>();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      //wrappig the column with form to apply the validation
      child: Form(
        //give formkey to the key of the form
        key: formKey,
        //apply validation with user interaction
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TitleText(text: "Create Account"),
            const SizedBox(height: 10),
            SignUpRowInputForNewAccountCreation(
              //validatior for first name
              validator1:
                  (val) =>
                      val == null || val.isEmpty
                          ? "Enter your first name"
                          : null,
              Label1: "First Name",
              hintText1: "First Name",
              onChanged1: (val) {
                // بنضمن إننا بنتعامل مع نص مش null
                String currentFull = authCubit.fullName ?? "";
                List<String> parts = currentFull.split(' ');
                String lastName = parts.length > 1 ? parts.last : "";
                authCubit.fullName = "$val $lastName".trim();
                print("Typing first name: $val");
              },
              //validator for last name
              validator2:
                  (val) =>
                      val == null || val.isEmpty
                          ? "Enter your last name"
                          : null,
              Label2: "Last Name",
              hintText2: "Last Name",
              onChanged2: (val) {
                String currentFull = authCubit.fullName ?? "";
                List<String> parts = currentFull.split(' ');
                String firstName = parts.isNotEmpty ? parts.first : "";
                authCubit.fullName = "$firstName $val".trim();
                print("Typing last name: $val");
              },
            ),
            const SizedBox(height: 12),
            CustomLabeledTextField(
              //validator for email
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Enter your email";
                }
                if (!val.contains("@")) {
                  return "Invalid email";
                }
                final gmailRegex = RegExp(r'^[\w-\.]+@gmail\.com$');
                if (!gmailRegex.hasMatch(val.trim())) {
                  return 'Please enter a valid @gmail.com address';
                }
                return null;
              },
              label: "Email",
              hintText: "example@example.com",
              onChanged: (val) {
                print("Typing email: $val");
                authCubit.email = val.trim(); // استخدام trim() مهم جداً للإيميل
              },
            ),
            const SizedBox(height: 18),
            CustomPhoneField(
              title: "Phone Number",
              onChanged: (val) {
                authCubit.phoneNumber = val; // هيتخزن في الكيوبيت فوراً
              },
            ),
            const SizedBox(height: 18),
            SignUpRowInputForNewAccountCreation(
              //validator for password
              validator1:
                  (val) => (val?.length ?? 0) < 8 ? "At least 8 chars" : null,
              Label1: "Password",
              hintText1: "password",
              onChanged1: (val) {
                authCubit.password = val;
              },
              //validator for confirm password
              validator2: (val) {
                if (val != authCubit.password) return "Doesn't match";
                return null;
              },
              Label2: "Confirm Password",
              hintText2: "confirm password",
              onChanged2: (val) {
                // هنا ممكن تقارن لو حابب
              },
              isPassword: true,
            ),
            const SizedBox(height: 40),
            Center(
              child: CustomButton(
                text: "Continue",

                onPressed: () {
                  //Make sure all the fields are valid
                  if (formKey.currentState!.validate()) {
                    // لو كل الـ Validators رجعت null (يعني مفيش أخطاء)
                    print("All good! Moving to Step 2");
                    onNext();
                  } else {
                    print("Please fix the errors first");
                  }
                  // تيست سريع للتأكد من وصول البيانات للـ Cubit
                  print("--- Test Step 1 Data ---");
                  print("Full Name: ${authCubit.fullName}");
                  print("Email: ${authCubit.email}");
                  print("Phone: ${authCubit.phoneNumber}");
                  print("Password: ${authCubit.password}");
                  print("------------------------");
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

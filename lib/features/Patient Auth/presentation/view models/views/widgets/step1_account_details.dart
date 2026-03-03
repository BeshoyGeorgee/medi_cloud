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
  const Step1AccountDetails({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    // عرفنا الـ Cubit في متغير عشان الكود يبقى أنضف وأسهل في القراءة
    final authCubit = context.read<PatientAuthCubit>();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TitleText(text: "Create Account"),
          const SizedBox(height: 10),
          SignUpRowInputForNewAccountCreation(
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
            Label1: "Password",
            hintText1: "password",
            onChanged1: (val) {
              authCubit.password = val;
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
                // تيست سريع للتأكد من وصول البيانات للـ Cubit
                print("--- Test Step 1 Data ---");
                print("Full Name: ${authCubit.fullName}");
                print("Email: ${authCubit.email}");
                print("Phone: ${authCubit.phoneNumber}");
                print("Password: ${authCubit.password}");
                print("------------------------");

                // لو البيانات ظهرت في الـ Console، يبقى الأسلاك واصلة صح
                onNext();
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
    );
  }
}

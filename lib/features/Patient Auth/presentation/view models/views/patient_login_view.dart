import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_button.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_textfield.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/signout_or_signin_row_text.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/title_text.dart';

class PatientLoginView extends StatefulWidget {
  const PatientLoginView({super.key});

  @override
  State<PatientLoginView> createState() => _PatientLoginViewState();
}

class _PatientLoginViewState extends State<PatientLoginView> {
  // تعريف الـ Key والـ Controllers
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: const CustomAuthAppBar(title: "Log In"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 61),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleText(text: "Welcome"),
                const SizedBox(height: 84),

                CustomLabeledTextField(
                  controller: emailController,
                  label: "Email",
                  hintText: "example@example.com",
                ),

                const SizedBox(height: 18),

                CustomLabeledTextField(
                  controller: passwordController,
                  label: "Password",
                  hintText: "************",
                  isPassword: true,
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // أضف منطق "نسيت كلمة المرور" هنا لاحقاً
                    },
                    child: Text(
                      "Forget Password?",
                      style: Styles.textStyle12.copyWith(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 174),

                Center(
                  child: CustomButton(
                    text: "Log In",
                    onPressed: () {
                      // منطق تسجيل الدخول الخام
                    },
                    width: 190,
                  ),
                ),

                const SizedBox(height: 26),

                SignUpOrSignInRowText(
                  text: "Don't have an account?",
                  actionText: "Sign Up",
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kPatientSignUpView);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
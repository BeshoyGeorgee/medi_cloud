import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/cubit/patient_auth_cubit.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/forget_password_text.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/go_to_sign_up_row.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/login_input_fields.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/login_submit_button.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/title_text.dart';

class PatientLoginView extends StatefulWidget {
  const PatientLoginView({super.key});

  @override
  State<PatientLoginView> createState() => _PatientLoginViewState();
}

class _PatientLoginViewState extends State<PatientLoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<PatientAuthCubit>();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: const CustomAuthAppBar(title: "Log In"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 61),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleText(text: "Welcome"),
                const SizedBox(height: 84),

                // 1. حقول الإدخال (Email & Password)
                LoginInputFields(authCubit: authCubit),

              
                const ForgetPasswordText(),

                const SizedBox(height: 100),

                // 2. زرار الدخول مع الـ Bloc Logic
                LoginSubmitButton(formKey: formKey, authCubit: authCubit),

                const SizedBox(height: 26),

                // 3. التوجيه لإنشاء حساب جديد
                const GoToSignUpRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

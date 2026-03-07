import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_button.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/cubit/patient_auth_cubit.dart';

class LoginSubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final PatientAuthCubit authCubit;

  const LoginSubmitButton({
    super.key,
    required this.formKey,
    required this.authCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientAuthCubit, PatientAuthState>(
      listener: (context, state) {
        if (state is PatientAuthSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.kPatientHomeView);
        } else if (state is PatientAuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.redAccent,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is PatientAuthLoading) {
          return const Center(
            child: CircularProgressIndicator(color: kPrimaryColor),
          );
        }
        return Center(
          child: CustomButton(
            text: "Log In",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                authCubit.loginPatient();
              }
            },
            width: 190,
          ),
        );
      },
    );
  }
}

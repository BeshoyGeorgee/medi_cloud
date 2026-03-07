import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_button.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/cubit/patient_auth_cubit.dart';

class RegistrationSubmitButton extends StatelessWidget {
  final PatientAuthCubit authCubit;
  const RegistrationSubmitButton({super.key, required this.authCubit});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientAuthCubit, PatientAuthState>(
      listener: (context, state) {
        if (state is PatientAuthSuccess) {
          GoRouter.of(
            context,
          ).pushReplacement(AppRouter.kSuccessRegistrationView);
        } else if (state is PatientAuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
              action:
                  state.errorMessage.contains("already registered")
                      ? SnackBarAction(
                        label: "Login",
                        textColor: Colors.white,
                        onPressed:
                            () => GoRouter.of(
                              context,
                            ).pushReplacement(AppRouter.kPatientLoginView),
                      )
                      : null,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is PatientAuthLoading)
          return const Center(
            child: CircularProgressIndicator(color: kPrimaryColor),
          );
        return Center(
          child: CustomButton(
            text: "Continue",
            onPressed: () => authCubit.registerPatient(),
            width: 190,
          ),
        );
      },
    );
  }
}

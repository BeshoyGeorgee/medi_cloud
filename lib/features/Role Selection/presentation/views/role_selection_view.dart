import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/Core/utils/user_roles.dart';
import 'package:medi_cloud_app/features/Auth/auth_cubit/auth_cubit.dart';
import 'package:medi_cloud_app/features/Role%20Selection/presentation/views/widgets/custome_button.dart';
import 'package:medi_cloud_app/features/Role%20Selection/presentation/views/widgets/selection_role_container.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/Core/utils/app_images.dart';

class RoleSelectionView extends StatelessWidget {
  const RoleSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RoleSelected) {
          switch (state.role) {
            case UserRole.patient:
              GoRouter.of(context).push(AppRouter.kPatientLoginView);
              break;
            case UserRole.doctor:
              GoRouter.of(context).push(AppRouter.kDoctorAuthView);
              break;
            case UserRole.hospital:
              GoRouter.of(context).push(AppRouter.kHospitalAuthView);
              break;
          }
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 61),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //welcome text
              Text(
                textAlign: TextAlign.left,
                "Welcome",
                style: Styles.textStyle24Bold.copyWith(
                  fontSize: 28,
                  color: theme.colorScheme.secondary,
                ),
              ),
              SizedBox(height: 45),
              Expanded(
                child: Center(
                  //Scroll view to make the view scrollable in case of small screens
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        //choose your role text
                        Text(
                          "Choose Your role",
                          style: Styles.textStyle24Bold.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        SizedBox(height: 9),
                        //display the selection role container widget for patient role
                        SelectionRoleContainer(
                          //take the image path from the app images file
                          imagePath: Assets.imagesPatientRole,
                        ),
                        SizedBox(height: 27),
                        //custom button for patient role
                        GestureDetector(
                          //on tap, select the patient role
                          onTap:
                              () => context.read<AuthCubit>().selectRole(
                                UserRole.patient,
                              ),
                          child: CustomeButton(
                            theme: theme,
                            text: "Patient",
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        SizedBox(height: 27),
                        //display the selection role container widget for doctor role
                        SelectionRoleContainer(
                          imagePath: Assets.imagesDoctorRole,
                        ),
                        SizedBox(height: 27),

                        //custom button for doctor role
                        GestureDetector(
                          //on tap, select the doctor role
                          onTap:
                              () => context.read<AuthCubit>().selectRole(
                                UserRole.doctor,
                              ),
                          child: CustomeButton(
                            theme: theme,
                            text: "Doctor",
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                        SizedBox(height: 27),
                        //display the selection role container widget for hospital role
                        SelectionRoleContainer(
                          imagePath: Assets.imagesDoctorRole,
                        ),
                        SizedBox(height: 27),
                        //custom button for hospital role
                        GestureDetector(
                          //on tap, select the hospital role
                          onTap:
                              () => context.read<AuthCubit>().selectRole(
                                UserRole.hospital,
                              ),
                          child: CustomeButton(
                            theme: theme,
                            text: "Hospital",
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

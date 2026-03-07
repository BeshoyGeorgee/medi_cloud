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

    return Scaffold(
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
                      CustomeButton(
                        theme: theme,
                        text: "Patient",
                        color: theme.colorScheme.primary,
                        onTap: () {
                          // نبلغ الكيوبيت بالدور (لو محتاج الداتا دي في مكان تاني)
                          context.read<AuthCubit>().selectRole(
                            UserRole.patient,
                          );
                          Future.microtask(() {
                            if (context.mounted) {
                              context.pushReplacement(AppRouter.kPatientSignUpView);
                            }
                          });
                        },
                      ),
                      SizedBox(height: 27),
                      //display the selection role container widget for doctor role
                      SelectionRoleContainer(
                        imagePath: Assets.imagesDoctorRole,
                      ),
                      SizedBox(height: 27),

                      //custom button for doctor role
                      CustomeButton(
                        theme: theme,
                        text: "Doctor",
                        color: theme.colorScheme.secondary,
                        onTap: () {
                          //Select Doctor role
                          context.read<AuthCubit>().selectRole(UserRole.doctor);
                          //Navigate to Doctor Login View
                          GoRouter.of(context).push(AppRouter.kDoctorAuthView);
                        },
                      ),
                      SizedBox(height: 27),
                      //display the selection role container widget for hospital role
                      SelectionRoleContainer(
                        imagePath: Assets.imagesDoctorRole,
                      ),
                      SizedBox(height: 27),
                      //custom button for hospital role
                      CustomeButton(
                        theme: theme,
                        text: "Hospital",
                        color: theme.colorScheme.secondary,
                        onTap: () {
                          //Select Hospital role
                          context.read<AuthCubit>().selectRole(
                            UserRole.hospital,
                          );
                          //Navigate to Hospital Login View
                          GoRouter.of(
                            context,
                          ).push(AppRouter.kHospitalAuthView);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

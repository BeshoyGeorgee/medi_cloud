import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_button.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/cubit/patient_auth_cubit.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/healt_condition_tile.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/title_text.dart';

class Step4HealthProfile extends StatefulWidget {
  final VoidCallback onNext;
  const Step4HealthProfile({super.key, required this.onNext});

  @override
  State<Step4HealthProfile> createState() => _Step4HealthProfileState();
}

class _Step4HealthProfileState extends State<Step4HealthProfile> {
  // بنعرف Map عشان نشيل حالة كل اختيار
  Map<String, bool> healthConditions = {
    "Diabetes": false,
    "Hypertension": false,
    "Smoker": false,
  };

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<PatientAuthCubit>();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TitleText(text: "Health Profile"),
          const SizedBox(height: 30),
          Text(
            "Do You Have Any Of The Following Conditions?",
            style: Styles.textStyle16.copyWith(
              color: const Color(0xff0D1B34),
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                bool areAllSelected = authCubit.healthConditions.values.every(
                  (v) => v == true,
                );
                authCubit.healthConditions.updateAll(
                  (key, value) => !areAllSelected,
                );
              });
            },
            child: Text(
              "Select All That Apply", // الكلمة ثابتة زي ما هي
              style: Styles.textStyle16.copyWith(
                color: kPrimaryColor,
                fontWeight: FontWeight.w500,
                // ممكن تشيل الـ underline لو مش عايز اليوزر يعرف إنها بتدوس،
                // بس الأفضل تسيبها عشان يحس إن فيه أكشن هنا.
              ),
            ),
          ),
          const SizedBox(height: 30),

          // بنعمل Loop على الـ Map اللي جوه الكيوبيت مباشرة
          ...authCubit.healthConditions.keys.map((condition) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: HealthConditionTile(
                title: condition,
                isSelected: authCubit.healthConditions[condition]!,
                onChanged: (value) {
                  setState(() {
                    authCubit.healthConditions[condition] = value!;
                  });
                },
              ),
            );
          }).toList(),

          const SizedBox(height: 100),

          BlocConsumer<PatientAuthCubit, PatientAuthState>(
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
                  text: "Continue",
                  onPressed: () {
                    GoRouter.of(
                      context,
                    ).pushReplacement(AppRouter.kSuccessRegistrationView);
                    print(
                      "Button Clicked!",
                    ); // ضيف السطر ده للتأكد إن الزرار شغال
                    authCubit.registerPatient();
                  },
                  width: 190,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

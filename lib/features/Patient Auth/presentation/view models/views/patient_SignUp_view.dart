import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/cubit/patient_auth_cubit.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/data/repo/patient_auth_repo.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/step3_body_measurments.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/step4_health_profile.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/success_registration_view.dart';

import 'widgets/custome_signup_stepper.dart';
import 'widgets/step1_account_details.dart';
import 'widgets/step2_personal_details.dart';

class PatientSignupView extends StatefulWidget {
  const PatientSignupView({super.key});

  @override
  State<PatientSignupView> createState() => _PatientSignupViewState();
}

class _PatientSignupViewState extends State<PatientSignupView> {
  final PageController _pageController = PageController();
  int _currentStep = 1;

  void nextStep() {
    if (_currentStep < 5) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  //Handle Previous Step for the arrow
  void previousStep() {
    if (_currentStep > 1) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // لو إنت في أول خطوة وعايز ترجع فعلاً للـ Login
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // لو الكيوبيت عندك بياخد Repo، استخدم getIt هنا
      create: (context) => PatientAuthCubit(PatientAuthRepo()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAuthAppBar(title: "Sign Up", onBack: previousStep),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: CustomeSignupStepper(currentStep: _currentStep),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                // يفضل تقفل الـ Swipe عشان اليوزر ميهربش من الـ Stepper
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentStep = index + 1;
                  });
                },
                children: [
                  Step1AccountDetails(onNext: nextStep),
                  Step2PersonalDetails(onNext: nextStep),
                  Step3BodyMeasurements(onNext: nextStep),
                  Step4HealthProfile(onNext: nextStep),
                  const SuccessRegistrationView(), // اتأكد إنها Const
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

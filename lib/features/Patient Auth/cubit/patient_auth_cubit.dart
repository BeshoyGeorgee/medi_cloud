import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart'; // ضروري عشان الـ TextEditingController
import 'package:medi_cloud_app/features/Patient%20Auth/data/repo/patient_auth_repo.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/patient_model.dart';
import 'package:meta/meta.dart';

part 'patient_auth_state.dart';

class PatientAuthCubit extends Cubit<PatientAuthState> {
  final PatientAuthRepo patientAuthRepo;
  PatientAuthCubit(this.patientAuthRepo) : super(PatientAuthInitial());

  // --- Step 1 Controllers ---
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // --- Step 2 Controllers ---
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController motherNameController = TextEditingController();
  final TextEditingController emergencyContactController =
      TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  // --- باقي المتغيرات (اللي مش محتاجة TextField مباشر أو ليها تعامل خاص) ---
  String? gender;
  String? birthDate;
  double? height;
  double? weight;
  String? bloodType;
  Map<String, bool> healthConditions = {
    "Diabetes": false,
    "Hypertension": false,
    "Smoker": false,
  };

  Future<void> registerPatient() async {
    // التأكد إن البيانات الأساسية موجودة (بنقرأ من الـ controller.text)
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        firstNameController.text.isEmpty) {
      emit(PatientAuthFailure("Please fill in all required fields"));
      return;
    }

    emit(PatientAuthLoading());
    try {
      final patient = PatientModel(
        // بنجمع الاسم الأول والأخير هنا وقت التسجيل
        fullName:
            "${firstNameController.text} ${lastNameController.text}".trim(),
        phoneNumber: phoneController.text,
        gender: gender ?? "Not Specified",
        birthDate: birthDate ?? "",
        height: height ?? 0.0,
        weight: weight ?? 0.0,
        bloodType: bloodType ?? "Unknown",
        healthConditions: healthConditions,
        nationalId: nationalIdController.text,
        motherName: motherNameController.text,
        emergencyContactInfo: emergencyContactController.text,
      );

      await patientAuthRepo.registerPatient(
        email: emailController.text.trim(),
        Password: passwordController.text,
        patientData: patient,
      );
      emit(PatientAuthSuccess());
    } catch (e) {
      if (!isClosed) {
        String errorMessage = "An unexpected error occurred";

        // فحص نوع الخطأ وتحويله لرسالة مفهومة
        if (e.toString().contains("user_already_exists")) {
          errorMessage =
              "This email is already registered. Please try logging in.";
        } else if (e.toString().contains("network_error")) {
          errorMessage = "Please check your internet connection.";
        } else if (e.toString().contains("invalid-email")) {
          errorMessage = "The email address is badly formatted.";
        } else {
          // لو الخطأ مش معروف، ابعت الرسالة الأصلية أو الرسالة الافتراضية
          errorMessage = e.toString();
        }

        emit(PatientAuthFailure(errorMessage));
      }
    }
  }

  // تنظيف الذاكرة مهم جداً عشان الأداء في الـ Pixel 8 Pro
  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nationalIdController.dispose();
    motherNameController.dispose();
    emergencyContactController.dispose();
    return super.close();
  }
}

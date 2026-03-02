import 'package:bloc/bloc.dart';

import 'package:medi_cloud_app/features/Patient%20Auth/data/repo/patient_auth_repo.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/patient_model.dart';
import 'package:meta/meta.dart';

part 'patient_auth_state.dart';

class PatientAuthCubit extends Cubit<PatientAuthState> {
  final PatientAuthRepo patientAuthRepo;
  PatientAuthCubit(this.patientAuthRepo) : super(PatientAuthInitial());

  String? email;
  String? password;
  String? fullName;
  String? phoneNumber;
  String? gender;
  String? birthDate;
  String? nationalId;
  String? emergencyContactInfo;
  String? motherName;
  double? height;
  double? weight;
  String? bloodType;
  Map<String, bool> healthConditions = {
    "Diabetes": false,
    "Hypertension": false,
    "Smoker": false,
  };

  Future<void> registerPatient() async {
    print(
      "Cubit: registerPatient started!",
    ); // لو السطر ده مطبعش، يبقى المشكلة في الزرار (UI)
    // التأكد إن أهم البيانات موجودة قبل ما نبدأ
    if (email == null || password == null || fullName == null) {
      print(
        "Cubit Error: Some fields are null! Email: $email, Name: $fullName",
      );
      emit(PatientAuthFailure("Please fill in all required fields"));
      return;
    }

    emit(PatientAuthLoading());
    try {
      final patient = PatientModel(
        fullName: fullName!,
        phoneNumber: phoneNumber ?? "", // استخدام قيمة افتراضية أمان أكتر
        gender: gender ?? "Not Specified",
        birthDate: birthDate ?? "",
        height: height ?? 0.0,
        weight: weight ?? 0.0,
        bloodType: bloodType ?? "Unknown",
        healthConditions: healthConditions,
        nationalId: nationalId,
        motherName: motherName,
        emergencyContactInfo: emergencyContactInfo,
      );

      await patientAuthRepo.registerPatient(
        email: email!,
        Password: password!,
        patientData: patient,
      );
      emit(PatientAuthSuccess());
    } catch (e) {
     if (!isClosed) {
        emit(PatientAuthFailure(e.toString()));
      }
      ;
    }
  }
}

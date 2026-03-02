import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/patient_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PatientAuthRepo {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<void> registerPatient({
    required String email,
    required String Password,
    required PatientModel patientData,
  }) async {
    try {
      final AuthResponse response = await _supabase.auth.signUp(
        password: Password,
        email: email,
      );

      final String? userId = response.user?.id;

      if (userId != null) {
        final completePatientData = {...patientData.toJson(), 'id': userId};

        print("Sending to Supabase: $completePatientData");

        // دي المرة الوحيدة اللي محتاجينها
        final insertResponse =
            await _supabase
                .from('patients')
                .insert(completePatientData)
                .select();

        print("Supabase Response Success: $insertResponse");

        // السطر اللي كان هنا (insert التاني) اتمسح عشان ميعملش Duplicate Key Error
      }
    } catch (e) {
      print("Error in Repo: $e"); // مهم جداً عشان لو فشل تعرف السبب
      throw Exception('Failed to register patient: ${e.toString()}');
    }
  }

  // داخل ملف الـ Repo بتاعك
  Future<PatientModel> loginPatient({
    required String email,
    required String password,
  }) async {
    try {
      // 1. تسجيل الدخول باستخدام البريد والباسورد
      final AuthResponse res = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final String? userId = res.user?.id;

      if (userId != null) {
        // 2. جلب بيانات المريض من جدول patients باستخدام الـ ID اللي رجع
        final data =
            await _supabase
                .from('patients')
                .select()
                .eq('id', userId)
                .single(); // بنقوله هات سطر واحد بس

        // 3. تحويل البيانات لـ Model عشان نستخدمها في التطبيق
        return PatientModel.fromJson(data);
      } else {
        throw Exception('User ID not found');
      }
    } catch (e) {
      print("Login Error: $e");
      throw Exception('Login Failed: ${e.toString()}');
    }
  }
}

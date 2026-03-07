import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_button.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/cubit/patient_auth_cubit.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/cm_and_kg_text_fields.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/custome_blood_type_dropdown.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/title_text.dart';

class Step3BodyMeasurements extends StatelessWidget {
  final VoidCallback onNext;
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  const Step3BodyMeasurements({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<PatientAuthCubit>();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TitleText(text: "Body Measurements"),
            const SizedBox(height: 86),

            // حقول الطول والوزن
            CmAndKgTextFields(
              // نمرر الكنترولرز من الكيوبيت مباشرة
              heightController: authCubit.heightController,
              weightController: authCubit.weightController,
              
              // Validation للطول
              heightValidator: (val) {
                if (val == null || val.isEmpty) return "Enter height";
                double? h = double.tryParse(val);
                if (h == null || h <= 0) return "Invalid";
                return null;
              },
              
              // Validation للوزن
              weightValidator: (val) {
                if (val == null || val.isEmpty) return "Enter weight";
                double? w = double.tryParse(val);
                if (w == null || w <= 0) return "Invalid";
                return null;
              },
            ),
            
            const SizedBox(height: 25),

            CustomBloodTypeDropdown(
              // يقرأ القيمة من الكيوبيت مباشرة عشان Persistence
              value: authCubit.bloodType, 
              onChanged: (val) {
                authCubit.bloodType = val;
              },
              validator: (val) => val == null ? "Select blood type" : null,
            ),
            
            const SizedBox(height: 160),

            Center(
              child: CustomButton(
                text: "Continue",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // تحويل القيم لـ double وتخزينها في الكيوبيت قبل الانتقال
                    authCubit.height = double.tryParse(authCubit.heightController.text) ?? 0.0;
                    authCubit.weight = double.tryParse(authCubit.weightController.text) ?? 0.0;
                    
                    print("Step 3 Validated");
                    onNext();
                  }
                },
                width: 190,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
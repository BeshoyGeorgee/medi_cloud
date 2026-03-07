import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_button.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_textfield.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/cubit/patient_auth_cubit.dart';

import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/custome_phone_field.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/gender_and_birth_date_text_field_row.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/title_text.dart';

class Step2PersonalDetails extends StatelessWidget {
  final VoidCallback onNext;
  // 1. إضافة Form Key لعمل Validation لبيانات الخطوة الثانية
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  const Step2PersonalDetails({super.key, required this.onNext});

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
            const TitleText(text: "Personal Details"),
            const SizedBox(height: 20),

            // الرقم القومي
            CustomLabeledTextField(
              label: "National Number",
              hintText: "30**********",
              controller: authCubit.nationalIdController, // الربط بالكنترولر
              keyboardType: TextInputType.number,
              validator: (val) {
                if (val == null || val.isEmpty)
                  return "National ID is required";
                if (val.length != 14) return "Must be 14 digits";
                return null;
              },
            ),

            const SizedBox(height: 18),

            // اسم الأم
            CustomLabeledTextField(
              label: "Mother's Name",
              hintText: "mother's name",
              controller: authCubit.motherNameController, // الربط بالكنترولر
              validator:
                  (val) => val == null || val.isEmpty ? "Required" : null,
            ),

            const SizedBox(height: 18),

            // رقم الطوارئ
            CustomPhoneField(
              title: "Emergency Contact Info",
              controller:
                  authCubit.emergencyContactController, // الربط بالكنترولر
            ),

            const SizedBox(height: 18),

            // الصف الخاص بالجنس وتاريخ الميلاد
            const GenderAndBirthDateTextFieldRow(),

            const SizedBox(height: 60),

            Center(
              child: CustomButton(
                text: "Continue",
                onPressed: () {
                  // الفحص قبل الانتقال لـ Step 3
                  if (formKey.currentState!.validate()) {
                    print("======= STEP 2 VALIDATED =======");
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

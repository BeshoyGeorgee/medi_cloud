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
  const Step2PersonalDetails({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<PatientAuthCubit>();
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TitleText(text: "Personal Details"),
          const SizedBox(height: 20),
          CustomLabeledTextField(
            label: "National Number",
            hintText: "30**********",
            onChanged: (val) => authCubit.nationalId = val,
          ),
          const SizedBox(height: 18),
          CustomLabeledTextField(
            label: "Mother's Name",
            hintText: "mother's name",
            onChanged: (val) => authCubit.motherName = val,
          ),
          SizedBox(height: 18),
          CustomPhoneField(
            title: "Emergency Contact Info",
            onChanged: (val) => authCubit.emergencyContactInfo = val,
          ),
          const SizedBox(height: 18),
          GenderAndBirthDateTextFieldRow(),
          const SizedBox(height: 60),
          Center(
            child: CustomButton(
              text: "Continue",
              onPressed: () {
                // ده التست اللي هيعرفنا كل حاجة واصلة ولا لأ
                print("======= CHECKING STEP 2 DATA =======");
                print("National ID: ${authCubit.nationalId}");
                print("Mother's Name: ${authCubit.motherName}");
                print("Emergency Contact: ${authCubit.emergencyContactInfo}");
                print("Gender: ${authCubit.gender}");
                print("Birth Date: ${authCubit.birthDate}");
                print("====================================");

                // لو البيانات بتطبع، انقل للخطوة اللي بعدها
                onNext();
              },
              width: 190,
            ),
          ),
        ],
      ),
    );
  }
}

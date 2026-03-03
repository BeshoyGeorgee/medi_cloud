import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_button.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/cubit/patient_auth_cubit.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/cm_and_kg_text_fields.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/custome_blood_type_dropdown.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/title_text.dart';

class Step3BodyMeasurements extends StatefulWidget {
  final VoidCallback onNext;
  const Step3BodyMeasurements({super.key, required this.onNext});

  @override
  State<Step3BodyMeasurements> createState() => _Step3BodyMeasurementsState();
}

class _Step3BodyMeasurementsState extends State<Step3BodyMeasurements> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String? selectedBloodType;

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<PatientAuthCubit>(); // نداء الكيوبيت

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TitleText(text: "Body Measurements"),
          const SizedBox(height: 86),

          // حقول الطول والوزن
          CmAndKgTextFields(
            heightController: heightController,
            weightController: weightController,
            // هنضيف onChanged هنا عشان نبعت القيم للكيوبيت
            onHeightChanged: (val) {
              // استبدال الفاصلة العربية بنقطة عشان الـ parse يشتغل صح
              String sanitized = val.replaceAll(',', '.');
              authCubit.height = double.tryParse(sanitized) ?? 0.0;
            },
            onWeightChanged: (val) {
              String sanitized = val.replaceAll(',', '.');
              authCubit.weight = double.tryParse(sanitized) ?? 0.0;
            },
          ),
          const SizedBox(height: 25),

          CustomBloodTypeDropdown(
            value: selectedBloodType,
            onChanged: (val) {
              setState(() {
                selectedBloodType = val;
                authCubit.bloodType = val; // تخزين فصيلة الدم في الكيوبيت
              });
            },
          ),
          const SizedBox(height: 160),

          Center(
            child: CustomButton(
              text: "Continue",
              onPressed: () {
                // تيست للتأكد من وصول الداتا
                print("--- Step 3 Test ---");
                print("Height: ${authCubit.height}");
                print("Weight: ${authCubit.weight}");
                print("Blood: ${authCubit.bloodType}");
                widget.onNext();
              },
              width: 190,
            ),
          ),
        ],
      ),
    );
  }
}

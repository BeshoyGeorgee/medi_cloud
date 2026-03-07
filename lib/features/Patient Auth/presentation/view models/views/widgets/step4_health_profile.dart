import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/cubit/patient_auth_cubit.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/add_othe_condition_section.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/health_conditions_list.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/health_profile_header.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/registeration_submit_button.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/title_text.dart';

class Step4HealthProfile extends StatefulWidget {
  final VoidCallback onNext;
  const Step4HealthProfile({super.key, required this.onNext});

  @override
  State<Step4HealthProfile> createState() => _Step4HealthProfileState();
}

class _Step4HealthProfileState extends State<Step4HealthProfile> {
  final TextEditingController _otherConditionController =
      TextEditingController();
  bool _isAddingOther = false;

  @override
  void dispose() {
    _otherConditionController.dispose();
    super.dispose();
  }

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
          const HealthProfileHeader(),
          const SizedBox(height: 30),

          // قائمة الحالات الصحية
          HealthConditionsList(
            conditions: authCubit.healthConditions,
            onChanged:
                (condition, value) => setState(
                  () => authCubit.healthConditions[condition] = value,
                ),
            onRemove:
                (condition) => setState(
                  () => authCubit.healthConditions.remove(condition),
                ),
          ),

          const SizedBox(height: 10),

          // جزء إضافة حالة جديدة
          AddOtherConditionSection(
            isAdding: _isAddingOther,
            controller: _otherConditionController,
            onToggle: (val) => setState(() => _isAddingOther = val),
            onAdd: (newCondition) {
              setState(() {
                authCubit.healthConditions[newCondition] = true;
                _isAddingOther = false;
                _otherConditionController.clear();
              });
            },
          ),

          const SizedBox(height: 40),

          // زرار التسجيل والـ Bloc Listener
          RegistrationSubmitButton(authCubit: authCubit),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

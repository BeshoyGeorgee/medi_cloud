import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/cubit/patient_auth_cubit.dart';
class HealthProfileHeader extends StatelessWidget {
  const HealthProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<PatientAuthCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Do You Have Any Of The Following Conditions?",
          style: Styles.textStyle16.copyWith(color: const Color(0xff0D1B34), fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            // Logic الـ Select All مدمج هنا للتبسيط
            bool areAllSelected = authCubit.healthConditions.values.every((v) => v == true);
            authCubit.healthConditions.updateAll((key, value) => !areAllSelected);
            (context as Element).markNeedsBuild(); // تحديث يدوي بسيط لو Widget stateless
          },
          child: Text(
            "Select All That Apply",
            style: Styles.textStyle16.copyWith(color: kPrimaryColor, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
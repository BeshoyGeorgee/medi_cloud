import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_textfield.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/cubit/patient_auth_cubit.dart';

class GenderAndBirthDateTextFieldRow extends StatefulWidget {
  const GenderAndBirthDateTextFieldRow({super.key});

  @override
  State<GenderAndBirthDateTextFieldRow> createState() =>
      _GenderAndBirthDateTextFieldRowState();
}

class _GenderAndBirthDateTextFieldRowState
    extends State<GenderAndBirthDateTextFieldRow> {
  final TextEditingController genderController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();

  @override
  void dispose() {
    genderController.dispose();
    birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // تعريف الكيوبيت لاستخدامه في onChanged و onTap
    final authCubit = context.read<PatientAuthCubit>();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- حقل النوع (Gender) ---
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Gender",
                style: Styles.textStyle20.copyWith(
                  color: const Color(0xff0D1B34),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                selectedItemBuilder: (BuildContext context) {
                  return ["Male", "Female"].map<Widget>((String item) {
                    return Text(
                      item,
                      style: Styles.textStyle16.copyWith(
                        color: kPrimaryColor.withOpacity(0.6),
                      ),
                    );
                  }).toList();
                },
                hint: Text(
                  "male",
                  style: Styles.textStyle16.copyWith(
                    color: kPrimaryColor.withOpacity(0.6),
                  ),
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kTexrFieldFillColor,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: kPrimaryColor,
                  ),
                ),
                iconSize: 0,
                items: ["Male", "Female"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: Styles.textStyle16.copyWith(
                        color: kPrimaryColor,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    genderController.text = newValue!;
                    // تحديث الكيوبيت فوراً
                    authCubit.gender = newValue;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 15),

        // --- حقل تاريخ الميلاد (Birth Date) ---
        Expanded(
          child: CustomLabeledTextField(
            label: "Birth Date",
            hintText: "mm-dd-yyyy",
            controller: birthDateController,
            readOnly: true,
            prefixIcon: const Icon(
              Icons.keyboard_arrow_down,
              color: kPrimaryColor,
            ),
            // تمرير الـ authCubit كـ parameter
            onTap: () => _selectDate(context, authCubit),
          ),
        ),
      ],
    );
  }

  // تم تعديل توقيع الدالة لتستقبل الـ authCubit
  Future<void> _selectDate(BuildContext context, PatientAuthCubit authCubit) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 20)),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: kPrimaryColor),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        String formattedDate = DateFormat('MM-dd-yyyy').format(picked);
        birthDateController.text = formattedDate;
        // تحديث الكيوبيت فوراً بالتاريخ المختار
        authCubit.birthDate = formattedDate;
      });
    }
  }
}
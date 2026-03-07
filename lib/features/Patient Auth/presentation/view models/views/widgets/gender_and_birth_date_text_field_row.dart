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
  // شيلنا الكنترولرز المحلية من هنا عشان هنستخدم اللي في الكيوبيت

  @override
  Widget build(BuildContext context) {
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
                style: Styles.textStyle18Bold.copyWith(
                  color: const Color(0xff0D1B34),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                // السطر ده هو السر: بيقرأ القيمة المتخزنة في الكيوبيت
                value: authCubit.gender,
                selectedItemBuilder: (BuildContext context) {
                  return ["Male", "Female"].map<Widget>((String item) {
                    return Text(
                      item,
                      style: Styles.textStyle16.copyWith(color: Colors.black),
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  //error border
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.red, width: 1.5),
                  ),
                  prefixIcon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: kPrimaryColor,
                  ),
                ),
                iconSize: 0,
                items:
                    ["Male", "Female"].map((String value) {
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
                    // تحديث الكيوبيت فوراً
                    authCubit.gender = newValue;
                  });
                },
                // إضافة فالي ديشن للـ Gender
                validator: (val) => val == null ? "Choose your gender" : null,
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
            // نستخدم الكنترولر اللي في الكيوبيت مباشرة
            controller: authCubit.birthDateController,
            readOnly: true,
            prefixIcon: const Icon(
              Icons.calendar_today_outlined, // غيرتها لشكل تقويم أفضل
              color: kPrimaryColor,
            ),
            onTap: () => _selectDate(context, authCubit),
            validator:
                (val) =>
                    (val == null || val.isEmpty)
                        ? "Pick your birth date"
                        : null,
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(
    BuildContext context,
    PatientAuthCubit authCubit,
  ) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
      firstDate: DateTime(1900),
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
        // التحديث بيسمع في الكيوبيت والكنترولر في نفس الوقت
        authCubit.birthDateController.text = formattedDate;
        authCubit.birthDate = formattedDate;
      });
    }
  }
}

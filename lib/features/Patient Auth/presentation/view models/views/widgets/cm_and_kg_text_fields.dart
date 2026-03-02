import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_textfield.dart';
import 'package:medi_cloud_app/constant.dart';

class CmAndKgTextFields extends StatelessWidget {
  final TextEditingController heightController;
  final TextEditingController weightController;
  final Function(String)? onHeightChanged; // إضافة الـ callback
  final Function(String)? onWeightChanged; // إضافة الـ callback

  const CmAndKgTextFields({
    super.key,
    required this.heightController,
    required this.weightController,
    this.onHeightChanged,
    this.onWeightChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomLabeledTextField(
            label: "Height",
            hintText: "cm",
            controller: heightController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: onHeightChanged, // ربط الـ onChanged
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: CustomLabeledTextField(
            label: "Weight",
            hintText: "kg",
            controller: weightController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: onWeightChanged, // ربط الـ onChanged
          ),
        ),
      ],
    );
  }
}

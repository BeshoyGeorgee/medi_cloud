import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_textfield.dart';

class CmAndKgTextFields extends StatelessWidget {
  final TextEditingController heightController;
  final TextEditingController weightController;
  final Function(String)? onHeightChanged; // إضافة الـ callback
  final Function(String)? onWeightChanged; // إضافة الـ callback

  // 1. إضافة الـ Validators هنا
  final String? Function(String?)? heightValidator;
  final String? Function(String?)? weightValidator;

  const CmAndKgTextFields({
    super.key,
    required this.heightController,
    required this.weightController,
    this.onHeightChanged,
    this.onWeightChanged,
    this.heightValidator,
    this.weightValidator,
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
            validator: heightValidator,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: onHeightChanged,
            maxLines: 3, // ربط الـ onChanged
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: CustomLabeledTextField(
            label: "Weight",
            hintText: "kg",
            controller: weightController,
            validator: weightValidator,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: onWeightChanged, // ربط الـ onChanged
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}

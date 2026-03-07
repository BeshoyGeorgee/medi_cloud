import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_textfield.dart';
import 'package:medi_cloud_app/constant.dart';

class AddOtherConditionSection extends StatelessWidget {
  final bool isAdding;
  final TextEditingController controller;
  final Function(bool) onToggle;
  final Function(String) onAdd;

  const AddOtherConditionSection({super.key, required this.isAdding, required this.controller, required this.onToggle, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    if (isAdding) {
      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: CustomLabeledTextField(label: "Enter Condition", hintText: "e.g. Asthma...", controller: controller)),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 22.0),
                child: CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  child: IconButton(
                    icon: const Icon(Icons.check, color: Colors.white),
                    onPressed: () => controller.text.isNotEmpty ? onAdd(controller.text.trim()) : null,
                  ),
                ),
              ),
            ],
          ),
          TextButton(onPressed: () => onToggle(false), child: const Text("Cancel", style: TextStyle(color: Colors.grey))),
        ],
      );
    }
    return OutlinedButton.icon(
      onPressed: () => onToggle(true),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        side: const BorderSide(color: kPrimaryColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      icon: const Icon(Icons.add, color: kPrimaryColor),
      label: Text("Add Other Condition", style: Styles.textStyle16.copyWith(color: kPrimaryColor)),
    );
  }
}
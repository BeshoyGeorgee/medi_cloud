import 'package:flutter/material.dart';
import 'package:medi_cloud_app/features/Patient%20Auth/presentation/view%20models/views/widgets/healt_condition_tile.dart';

class HealthConditionsList extends StatelessWidget {
  final Map<String, bool> conditions;
  final Function(String, bool) onChanged;
  final Function(String) onRemove;

  const HealthConditionsList({
    super.key,
    required this.conditions,
    required this.onChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          conditions.keys.map((condition) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                children: [
                  Expanded(
                    child: HealthConditionTile(
                      title: condition,
                      isSelected: conditions[condition]!,
                      onChanged: (val) => onChanged(condition, val!),
                    ),
                  ),
                  if (![
                    "Diabetes",
                    "Hypertension",
                    "Smoker",
                  ].contains(condition))
                    IconButton(
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.redAccent,
                      ),
                      onPressed: () => onRemove(condition),
                    ),
                ],
              ),
            );
          }).toList(),
    );
  }
}

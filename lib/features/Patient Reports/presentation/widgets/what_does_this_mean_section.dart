import 'package:flutter/material.dart';
import 'package:medi_cloud_app/constant.dart';

class WhatDoesThisMeanSection extends StatelessWidget {
  const WhatDoesThisMeanSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppDecorations.borderRadius16,
        boxShadow: const [AppDecorations.defaultShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'What does this mean?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: kDarkTextColor),
              ),
              Icon(Icons.keyboard_arrow_down, color: kGreyColor),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Normal resting heart rate for adults is 60-100 BPM. A lower resting HR often indicates good fitness. Persistent elevation may require medical consultation.',
            style: TextStyle(fontSize: 14, color: kDarkTextColor, height: 1.6, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
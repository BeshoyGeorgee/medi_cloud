import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/insurance_details_body.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/make_claim_body.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/toggle_button_for_insurance.dart';

class InsuranceView extends StatefulWidget {
  const InsuranceView({super.key});

  @override
  State<InsuranceView> createState() => _InsuranceViewState();
}

class _InsuranceViewState extends State<InsuranceView> {
  bool isDetailsSelected = true; // متغير عشان نعرف أي تابة مختارة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomAppBar(title: "Insurance"),

          const SizedBox(height: 20),

          // --- 1. Custom Toggle Buttons (Insurance details & Make claim) ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: ToggleButton(
                    title: "Insurance details",
                    isSelected: isDetailsSelected,
                    onTap: () => setState(() => isDetailsSelected = true),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ToggleButton(
                    title: "Make claim",
                    isSelected: !isDetailsSelected,
                    onTap: () => setState(() => isDetailsSelected = false),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // --- 2. Dynamic Content (The Body) ---
          Expanded(
            child:
                isDetailsSelected
                    ? const InsuranceDetailsBody() // الصفحة اللي فيها الـ ExpansionTile
                    : const MakeClaimBody(), // الصفحة اللي فيها Cardiac Biomarkers
          ),
        ],
      ),
    );
  }
}

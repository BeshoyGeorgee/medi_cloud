import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/app_images.dart'; 
import 'package:medi_cloud_app/Core/utils/widgets/custom_expandable_section.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_stop_follow_up_dialog.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/my_doc_hos_card.dart';
import 'package:medi_cloud_app/features/Patient%20Hospital/Presentation/view/widgets/explore/hospital_location_section.dart'; 

class HospitalProfileTab extends StatelessWidget {
  const HospitalProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- 1. Hospital Info Card (Reusable) ---
          MyDocHosCard(
            // Use the image variable from your Assets file
            imageAsset: Assets.imagesSaudiGerman, 
            title: 'Saudi German',
            subtitle: 'New Nozha, Cairo, Egypt.',
            onTap: () {
              // Left empty because this card is view-only on this screen
            },
          ),
          
          const SizedBox(height: 16),

          // --- 2. About Section (Reusable) ---
          const CustomExpandableSection(
            title: 'About Hospital',
            shortText: 'Dr. Carly Angel is the top most immunologists specialist in Crist Hospital in London, UK.',
            fullText: 'Dr. Carly Angel is the top most immunologists specialist in Crist Hospital in London, UK. She has over 15 years of experience treating various conditions and ensures the best care for all patients.',
          ),
          
          const SizedBox(height: 16),

          // --- 3. Location Section (Reusable) ---
          // Note: Since this widget uses HospitalDetailsCubit, 
          // ensure this screen (or its router) is wrapped with a BlocProvider for this cubit.
          const HospitalLocationSection(),
          
          const SizedBox(height: 32),

          // --- 4. Leave Hospital Button & Dialog (Reusable) ---
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // Trigger the custom dialog
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomStopFollowUpDialog(
                       title: 'Confirm Discharge',
                       subtitle: 'Are you sure you want to process the discharge? This will close the current hospital admission record and stop inpatient alerts',
                       onConfirm: () {
                       },
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF0000), // Red color as per design
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Leave Hospital',
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 16, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
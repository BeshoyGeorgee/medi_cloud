import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';
import 'my_doc_hos_card.dart';

class MyHospitalSection extends StatelessWidget {
  const MyHospitalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Text(
          'My Hospital',
          style: Styles.textStyle22Bold.copyWith(color: kShadePrimaryColor),
        ),
        const SizedBox(height: 15),
        
        // --- Single Hospital Card ---
        MyDocHosCard(
          imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Saudi_German_Hospital_Logo.png/800px-Saudi_German_Hospital_Logo.png', 
          title: 'Saudi German',
          subtitle: 'New Nozha, Cairo, Egypt.',
          onTap: () {
            debugPrint('My Hospital card clicked');
          },
        ),
      ],
    );
  }
}
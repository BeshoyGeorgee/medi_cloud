import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/custome_drop_down_field.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/custome_profile_field.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/custome_profile_image.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/custome_save_button.dart';

class PatientProfileView extends StatelessWidget {
  const PatientProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomAppBar(title: "Profile", showEditIcon: true),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  customeProfileImage(),
                  const SizedBox(height: 10),
                  Text(
                    "Patient ID: 000-000",
                    style: Styles.textStyle20.copyWith(
                      color: Color(0xff949494),
                    ),
                  ),
                  customeProfileField(label: "Name", hint: "XXXXXXXXXXXXX"),
                  customeProfileField(
                    label: "Email",
                    hint: "XXXXXXX@gmail.com",
                    isEmail: true,
                  ),
                  customeProfileField(
                    label: "Contact info (phone number)",
                    hint: "202XXXXXXX",
                  ),
                  customeProfileField(
                    label: "Emergency contact info",
                    hint: "202XXXXXXX",
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: customeDropdownField(
                          label: "Date of Birth",
                          value: "23/05/19XX",
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: customeDropdownField(
                          label: "Gender",
                          value: "XXXX",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  customeSaveButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

Widget drawerHeader() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(top: 60, left: 20, bottom: 20),
    decoration: const BoxDecoration(
      border: Border(bottom: BorderSide(color: Color(0xffE0E0E0), width: 0.5)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(
            'https://randomuser.me/api/portraits/men/32.jpg',
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'James Ahmed',
          style: Styles.textStyle18Bold.copyWith(color: kShadePrimaryColor),
        ),
      ],
    ),
  );
}

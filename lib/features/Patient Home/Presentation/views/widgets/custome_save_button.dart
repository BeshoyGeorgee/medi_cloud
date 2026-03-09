import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

Widget customeSaveButton() {
  return SizedBox(
    width: 220,
    height: 45,
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        elevation: 0,
      ),
      child: Text(
        "Save Changes",
        style: Styles.textStyle18Medium.copyWith(color: Colors.white),
      ),
    ),
  );
}

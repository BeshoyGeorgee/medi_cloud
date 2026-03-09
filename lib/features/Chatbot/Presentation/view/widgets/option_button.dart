import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

Widget OptionButton(String text) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 12),
    height: 50,
    child: OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: kPrimaryColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Text(
        text,
        style: Styles.textStyle18Bold.copyWith(
          color: Color(0xff16504B),
          fontSize: 16,
        ),
      ),
    ),
  );
}

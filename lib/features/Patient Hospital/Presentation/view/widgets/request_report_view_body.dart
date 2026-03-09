import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart';
import 'package:medi_cloud_app/constant.dart';

class RequestReportViewBody extends StatelessWidget {
  const RequestReportViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(title:'Report Request',textColor: kShadePrimaryColor,)
      ],
    );
  }
}
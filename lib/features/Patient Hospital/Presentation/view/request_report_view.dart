import 'package:flutter/material.dart';
import 'package:medi_cloud_app/features/Patient%20Hospital/Presentation/view/widgets/request_report_view_body.dart';

class RequestReportView extends StatelessWidget {
  const RequestReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RequestReportViewBody(),
    );
  }
}
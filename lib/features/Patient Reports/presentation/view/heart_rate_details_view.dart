import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_cloud_app/features/Patient%20Reports/presentation/view%20model/reports_cubit.dart';
// تأكد من مسار الكيوبت بتاعك
import 'package:medi_cloud_app/features/Patient%20Reports/presentation/widgets/heart_rate_details_view_body.dart';

class HeartRateDetailsView extends StatelessWidget {
  const HeartRateDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // وفرنا الكيوبت هنا عشان الـ Body يلاقيه
    return BlocProvider(
      create: (context) => ReportsCubit(),
      child: const Scaffold(
        body: SafeArea(
          child: HeartRateDetailsViewBody(),
        ),
      ),
    );
  }
}
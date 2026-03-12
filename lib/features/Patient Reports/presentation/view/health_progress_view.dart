import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_cloud_app/constant.dart'; // تأكد إن ده مسار ثوابت الألوان
import 'package:medi_cloud_app/features/Patient%20Reports/presentation/view%20model/reports_cubit.dart';
import 'package:medi_cloud_app/features/Patient%20Reports/presentation/widgets/health_progress_view_body.dart';

class HealthProgressView extends StatelessWidget {
  const HealthProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. توفير الكيوبت للشاشة
    return BlocProvider(
      create: (context) => ReportsCubit(),
      child: const Scaffold(
        backgroundColor: kBackgroundColor,
        // 2. SafeArea عشان الـ CustomAppBar ينزل تحت شريط البطارية
        body: SafeArea(
          child: HealthProgressViewBody(),
        ),
      ),
    );
  }
}
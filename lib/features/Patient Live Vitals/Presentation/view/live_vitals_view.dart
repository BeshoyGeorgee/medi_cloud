import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Live%20Vitals/Data/live_vitals_cubit.dart';
import 'package:medi_cloud_app/features/Patient%20Live%20Vitals/Presentation/view/widgets/live_vitals_view_body.dart'; // ظبط المسار

class LiveVitalsView extends StatelessWidget {
  const LiveVitalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LiveVitalsCubit(),
      child: const Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: LiveVitalsBody(),
        ),
      ),
    );
  }
}
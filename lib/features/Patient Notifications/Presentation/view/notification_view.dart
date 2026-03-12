import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_cloud_app/features/Patient%20Notifications/Presentation/view_model/notification_cubit.dart';
import 'package:medi_cloud_app/features/Patient%20Notifications/Presentation/widgets/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // تأكد إن الـ create موجود هنا
      create: (context) => NotificationCubit()..loadNotifications(0),
      child: const Scaffold(
        body: SafeArea(
          child: NotificationViewBody(),
        ),
      ),
    );
  }
}
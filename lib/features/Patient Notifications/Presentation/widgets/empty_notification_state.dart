import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_cloud_app/constant.dart';
// تأكد من مسار الكيوبت
import 'package:medi_cloud_app/features/Patient%20Notifications/Presentation/view_model/notification_cubit.dart';

class EmptyNotificationState extends StatelessWidget {
  const EmptyNotificationState({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state is NotificationLoading || state is NotificationInitial) {
          return const Center(
            child: CircularProgressIndicator(color: kPrimaryColor),
          );
        }

        if (state is NotificationEmpty) {
          return const Center(
            child: Text(
              'No notifications',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: kGreyColor,
              ),
            ),
          );
        }

        return const SizedBox(); 
      },
    );
  }
}
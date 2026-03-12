import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart';

// مسار الـ Search Bar بتاعك (تأكد من صحة المسار)
import 'package:medi_cloud_app/Core/utils/widgets/custom_search_bar.dart';
// مسار الكيوبت
import 'package:medi_cloud_app/features/Patient%20Notifications/Presentation/view_model/notification_cubit.dart';

// استدعاء الويدجتس المنفصلة
import 'custom_notification_tab_bar.dart';
import 'empty_notification_state.dart';

class NotificationViewBody extends StatefulWidget {
  const NotificationViewBody({super.key});

  @override
  State<NotificationViewBody> createState() => _NotificationViewBodyState();
}

class _NotificationViewBodyState extends State<NotificationViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    _tabController.addListener(() {
      if (mounted) {
        setState(() {}); // بتغير لون التاب
        // بتخلي الكيوبت يحمل داتا التاب الجديد
        if (!_tabController.indexIsChanging) {
          context.read<NotificationCubit>().loadNotifications(
            _tabController.index,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(title: 'Notification'),
        const SizedBox(height: 10),

        // 1. التابات المخصصة
        CustomNotificationTabBar(tabController: _tabController),

        // 2. استخدام الـ CustomSearchBar بتاعك
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: CustomSearchBar(
            hintText: 'Search . . .',
            onChanged: (value) {
              // بنبعت الكلام اللي بيتكتب للكيوبت عشان يعمل فلترة
              context.read<NotificationCubit>().searchNotifications(value);
            },
          ),
        ),

        // 3. محتوى التابات (الـ Empty State اللي بتراقب الكيوبت)
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              EmptyNotificationState(), // Articles
              EmptyNotificationState(), // Alerts
              EmptyNotificationState(), // Reports
              EmptyNotificationState(), // Test Results
            ],
          ),
        ),
      ],
    );
  }
}

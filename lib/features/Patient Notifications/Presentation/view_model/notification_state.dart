part of 'notification_cubit.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

// الحالة دي هنستخدمها بعدين لما يجي داتا حقيقية
class NotificationLoaded extends NotificationState {
  // final List<NotificationModel> notifications;
  // NotificationLoaded(this.notifications);
}

// الحالة اللي إنت طالبها تظهر دلوقتي
class NotificationEmpty extends NotificationState {}
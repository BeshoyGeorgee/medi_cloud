import 'package:flutter_bloc/flutter_bloc.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  int currentTabIndex = 0;

  // الدالة اللي بتجيب الإشعارات بناءً على التاب اللي واقفين عليه
  void loadNotifications(int tabIndex) {
    currentTabIndex = tabIndex;
    emit(NotificationLoading());

    // محاكاة جلب البيانات من السيرفر (نص ثانية لودينج)
    Future.delayed(const Duration(milliseconds: 500), () {
      // حالياً بنبعت Empty دايماً عشان تظهر رسالة No notifications زي الديزاين
      emit(NotificationEmpty());
    });
  }

  // الدالة الخاصة بالبحث
  void searchNotifications(String query) {
    emit(NotificationLoading());

    Future.delayed(const Duration(milliseconds: 500), () {
      // بعد ما يبحث، برضه هنعرضله Empty مؤقتاً
      emit(NotificationEmpty());
    });
  }
}
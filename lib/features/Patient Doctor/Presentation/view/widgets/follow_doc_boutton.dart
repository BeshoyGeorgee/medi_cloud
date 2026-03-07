import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_cloud_app/Core/utils/app_router.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_button.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_stop_follow_up_dialog.dart' show CustomStopFollowUpDialog;
import 'package:medi_cloud_app/features/Patient%20Doctor/Data/doctor_profile_cubit.dart';
import 'package:medi_cloud_app/features/Patient%20Doctor/Data/doctor_profile_state.dart';

class FollowDocB extends StatelessWidget {
  const FollowDocB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          bottom: 24.0,
          top: 8.0,
        ),
        // --- دمجنا الـ BlocBuilder هنا ---
        child: BlocBuilder<DoctorProfileCubit, DoctorProfileState>(
          builder: (context, state) {
            // بنقرا الحالة الحالية من الكيوبت
            bool isFollowed = false;
            if (state is DoctorFollowStatusChanged) {
              isFollowed = state.isFollowed;
            }
    
            // لو متابع الدكتور -> نعرض الزرار الأحمر
            if (isFollowed) {
              return CustomButton(
                text: 'Cancel follow-up with the doctor',
                backgroundColor:
                    Colors
                        .red, // تأكد إنك ضايف الخاصية دي جوه ويدجت الـ CustomButton
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (dialogContext) => CustomStopFollowUpDialog(
                          title: 'Stop Follow-up',
                          subtitle:
                              'Are you sure you want to stop your follow-up with Dr. Warren? They will no longer receive your health updates or progress reports.',
                          confirmBtnText: 'Stop Follow-up',
                          cancelBtnText: 'Keep Follow-up',
                          onConfirm: () {
                            // بنبلغ الكيوبت إنه يلغي المتابعة
                            context
                                .read<DoctorProfileCubit>()
                                .unfollowDoctor();
                          },
                        ),
                  );
                },
              );
            }
            // لو مش متابع الدكتور -> نعرض الزرار الأخضر
            else {
              return CustomButton(
                text: 'Request to follow up',
                onPressed: () {
                  // بنبلغ الكيوبت إنه يتابع
                  context.read<DoctorProfileCubit>().followDoctor();
                  // ونروح لصفحة النجاح
                  GoRouter.of(context).push(AppRouter.kSuccessDocComfView);
                },
              );
            }
          },
        ),
      ),
    );
  }
}

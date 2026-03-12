import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_cloud_app/constant.dart';
// تأكد من مسار الكيوبت بتاعك
import 'package:medi_cloud_app/features/Patient%20Live%20Vitals/Data/live_vitals_cubit.dart'; 

class SecurityPinViewBody extends StatelessWidget {
  final String pinCode; 
  
  const SecurityPinViewBody({super.key, required this.pinCode});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Your Security PIN is',
            style: TextStyle(fontSize: 18, color: kShadePrimaryColor, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 24),
          
          Text(
            pinCode.split('').join(' '), // بيعمل مسافة بين كل حرف والتاني
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: 2, color: kDarkTextColor),
          ),
          const SizedBox(height: 40),
          
          // الـ BlocBuilder اللي بيراقب حالة النسخ
          BlocBuilder<LiveVitalsCubit, LiveVitalsState>(
            builder: (context, state) {
              bool isCopied = context.read<LiveVitalsCubit>().isPinCopied;
              
              return SizedBox(
                width: 160,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isCopied ? kGreyColor : kPrimaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    elevation: 0,
                  ),
                  onPressed: isCopied 
                      ? null // لو اتنسخ خلاص، عطل الزرار
                      : () {
                          context.read<LiveVitalsCubit>().copyPinToClipboard(pinCode);
                        },
                  child: Text(
                    isCopied ? 'Copied' : 'Copy',
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
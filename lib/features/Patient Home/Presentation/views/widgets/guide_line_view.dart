import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';

class GuideLineView extends StatelessWidget {
  const GuideLineView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      itemCount: 3,
      separatorBuilder:
          (context, index) => const SizedBox(height: 16), // مسافة بين الكروت
      itemBuilder: (context, index) {
        return Container(
          clipBehavior:
              Clip.antiAlias, // عشان الحواف الملونة متطلعش بره الـ Border
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent, // بيشيل الخطوط الافتراضية
            ),
            child: ExpansionTile(
              // الجزء ده هو اللي بيلون رأس التابة لما تتفتح زي الديزاين
              collapsedBackgroundColor: Colors.white,
              backgroundColor: Color(0xffe1edeb),
              tilePadding: const EdgeInsets.symmetric(horizontal: 16),

              // شكل السهم واللون بتاعه
              iconColor: Colors.grey,
              collapsedIconColor: Colors.grey,

              title: Text(
                "Menu item",
                style: Styles.textStyle18Medium.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              children: [
                // المحتوى الداخلي
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white, // المحتوى بيفضل أبيض زي الديزاين
                    border: Border(top: BorderSide(color: Color(0xffE0E0E0))),
                  ),
                  child: const Text(
                    "Supporting line text lorem ipsum dolor sit amet, consectetur.Supporting line text lorem ipsum dolor sit amet, consectetur.Supporting line text lorem ipsum dolor sit amet, consectetur.",
                    style: TextStyle(
                      color: Color(0xff49454F), // لون رمادي غامق احترافي
                      height: 1.5,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/article_tab_view.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/custome_tab_item.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/guide_line_view.dart';

class WorldHealthOrganizationView extends StatefulWidget {
  const WorldHealthOrganizationView({super.key});

  @override
  State<WorldHealthOrganizationView> createState() =>
      _WorldHealthOrganizationViewState();
}

class _WorldHealthOrganizationViewState
    extends State<WorldHealthOrganizationView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    // تأكد إن الـ length مطابق للأطفال تحت
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "World Health Organization"),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TabBar(
              controller: tabController,
              // 1. شيلنا isScrollable عشان يملوا العرض كله
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.label,
              // 2. بنصفر الـ padding عشان الـ CustomTabItem ياخد راحته
              labelPadding: EdgeInsets.symmetric(horizontal: 4),
              tabs: [
                CustomTabItem(
                  text: "Articles",
                  icon: Icons.check,
                  isSelected: tabController.index == 0,
                ),
                CustomTabItem(
                  text: "Clinical heart guidelines",
                  icon: Icons.check,
                  // 3. صلحنا الـ index هنا لـ 1 لأن الطول 2
                  isSelected: tabController.index == 1,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [ArticlesTabView(), GuideLineView()],
            ),
          ),
        ],
      ),
    );
  }
}

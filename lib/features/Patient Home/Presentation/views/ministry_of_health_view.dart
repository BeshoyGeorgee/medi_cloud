import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/alert_content_view.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/article_tab_view.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/custome_tab_item.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/guide_line_view.dart';

class MinistryOfHealthView extends StatefulWidget {
  const MinistryOfHealthView({super.key});

  @override
  State<MinistryOfHealthView> createState() => _MinistryOfHealthViewState();
}

class _MinistryOfHealthViewState extends State<MinistryOfHealthView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FB),
      body: Column(
        children: [
          const CustomAppBar(title: "Ministry of Health"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              labelPadding: const EdgeInsets.symmetric(horizontal: 4),
              tabs: [
                CustomTabItem(
                  text: "Articles",
                  icon: Icons.check,
                  isSelected: _tabController.index == 0,
                ),
                CustomTabItem(
                  text: "Alerts",
                  icon: Icons.check,
                  isSelected: _tabController.index == 1,
                ),
                CustomTabItem(
                  text: "Clinical heart guidelines",
                  icon: Icons.check,
                  isSelected: _tabController.index == 2,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ArticlesTabView(),
                AlertContentView(),
                GuideLineView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

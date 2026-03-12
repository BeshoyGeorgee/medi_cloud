import 'package:flutter/material.dart';
import 'package:medi_cloud_app/constant.dart';

class CustomNotificationTabBar extends StatelessWidget {
  final TabController tabController;

  const CustomNotificationTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TabBar(
        controller: tabController,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        indicatorColor: Colors.transparent, 
        dividerColor: Colors.transparent,
        labelPadding: const EdgeInsets.symmetric(horizontal: 4), 
        tabs: [
          _buildTabItem("Articles", 0),
          _buildTabItem("Alerts", 1),
          _buildTabItem("Reports", 2),
          _buildTabItem("Test Results", 3),
        ],
      ),
    );
  }

  Widget _buildTabItem(String text, int index) {
    bool isSelected = tabController.index == index;
    return Tab(
      height: 40,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffd1e3e0) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey.shade300,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: kDarkTextColor,
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:medi_cloud_app/constant.dart'; 
import 'package:medi_cloud_app/features/Patient%20Hospital/Presentation/view/widgets/dashboard/care_plan_tab.dart';
import 'package:medi_cloud_app/features/Patient%20Hospital/Presentation/view/widgets/dashboard/health_report_tab.dart';
import 'package:medi_cloud_app/features/Patient%20Hospital/Presentation/view/widgets/dashboard/hospital_profile_tab.dart';
import 'package:medi_cloud_app/features/Patient%20Hospital/Presentation/view/widgets/dashboard/test_results_tab.dart'; 

class MyHospitalDashboardBody extends StatelessWidget {
  const MyHospitalDashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, 
      child: Column(
        children: [
          const SizedBox(height: 10),
          
          // Using Builder to access the DefaultTabController
          Builder(
            builder: (context) {
              final tabController = DefaultTabController.of(context);
              
              // AnimatedBuilder listens to tab changes to update colors immediately
              return AnimatedBuilder(
                animation: tabController,
                builder: (context, child) {
                  return Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: TabBar(
                      isScrollable: true, 
                      tabAlignment: TabAlignment.start, 
                      dividerColor: Colors.transparent, 
                      
                      // Hide the default Indicator to draw a custom one
                      indicator: const BoxDecoration(color: Colors.transparent),
                      
                      // Padding between each tab
                      labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                      
                      tabs: [
                        _buildCustomTab('Hospital Profile', 0, tabController.index),
                        _buildCustomTab('Care plan', 1, tabController.index),
                        _buildCustomTab('Test Results', 2, tabController.index),
                        _buildCustomTab('Health Report', 3, tabController.index),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          
          const SizedBox(height: 16),
          
          const Expanded(
            child: TabBarView(
              children: [
                HospitalProfileTab(), 
                CarePlanTab(),        
                TestResultsTab(),     
                HealthReportTab(),    
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to draw the custom tab shape
  Widget _buildCustomTab(String text, int index, int currentIndex) {
    final isSelected = currentIndex == index;
    
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          // Selected tab gets a light primary color background, unselected gets transparent
          color: isSelected ? kPrimaryColor.withAlpha(38) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          
          // Unselected tab gets a light grey border, selected gets no border
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            // Updated: Selected tab text uses kShadePrimaryColor, unselected uses grey
            color: isSelected ? kShadePrimaryColor : Colors.grey,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
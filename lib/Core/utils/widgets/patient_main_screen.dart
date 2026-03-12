import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_bottom_nav_bar.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Chatbot/Presentation/view/chatbot_view.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/custome_drawer.dart';
import 'package:medi_cloud_app/features/Patient%20Home/Presentation/views/widgets/patient_home_view_body.dart';
import 'package:medi_cloud_app/features/Patient%20Reports/presentation/view/my_reports_view.dart';


// Must be Stateful to hold the current index state
class PatientMainScreen extends StatefulWidget {
  const PatientMainScreen({super.key});

  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();
  @override
  State<PatientMainScreen> createState() => _PatientMainScreenState();
}

class _PatientMainScreenState extends State<PatientMainScreen> {
  // Starts at 0 (Home Screen)
  int _currentIndex = 0;

  // List of screens to navigate between
  final List<Widget> _screens = [
    const PatientHomeViewBody(), // 0: The beautiful home screen we built
    const ChatbotView(), // 1: Placeholder for Chat
    const MyReportsView(), // 2: Placeholder for Menu
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: PatientMainScreen.scaffoldKey,
      drawer: const CustomDrawer(),
      backgroundColor: kBackgroundColor,
      // The body changes based on the tapped icon
      body: _screens[_currentIndex],

      // Setting extendBody to true allows the background to flow under the rounded corners of the nav bar
      extendBody: true,

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          // Updates the UI when a tab is clicked
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medi_cloud_app/constant.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // Height of the bottom bar
      decoration: BoxDecoration(
        color: Colors.white,
        // Rounded corners at the top matching your design
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          // A very light shadow pointing upwards to separate it from the background
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, -5), 
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // --- Tab 0: Home ---
          _buildNavItem(
            index: 0,
            icon: Icons.home_filled, // Filled icon when selected
            unselectedIcon: Icons.home_outlined, // Outlined when unselected
          ),
          
          // --- Tab 1: Chat ---
          _buildNavItem(
            index: 1,
            // Using standard icons. If you have SVG files for the exact icons, 
            // you can replace these with SvgPicture.asset() later
            icon: Icons.chat_bubble, 
            unselectedIcon: Icons.chat_bubble_outline,
          ),
          
          // --- Tab 2: Menu/Dashboard ---
          _buildNavItem(
            index: 2,
            icon: Icons.dashboard,
            unselectedIcon: Icons.dashboard_outlined,
          ),
        ],
      ),
    );
  }

  // A helper method to build each individual icon
  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required IconData unselectedIcon,
  }) {
    final isSelected = currentIndex == index;
    
    return GestureDetector(
      onTap: () => onTap(index),
      // HitTestBehavior.opaque ensures the whole padding area is clickable, not just the exact icon pixels
      behavior: HitTestBehavior.opaque, 
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Icon(
          isSelected ? icon : unselectedIcon,
          size: 28,
          // Colors change based on selection state
          color: isSelected ? kPrimaryColor : kGreyColor,
        ),
      ),
    );
  }
}
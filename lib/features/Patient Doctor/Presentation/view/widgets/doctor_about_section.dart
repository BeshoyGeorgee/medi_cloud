import 'package:flutter/gestures.dart'; // Required for TapGestureRecognizer
import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

class DoctorAboutSection extends StatefulWidget {
  const DoctorAboutSection({super.key});

  @override
  State<DoctorAboutSection> createState() => _DoctorAboutSectionState();
}

class _DoctorAboutSectionState extends State<DoctorAboutSection> {
  // Boolean state to track if the text is expanded or not
  bool isExpanded = false;
  
  // Recognizer to handle clicks on specific words inside RichText
  late TapGestureRecognizer _readMoreRecognizer;

  // The dummy data for short and full text
  final String shortText = 'Dr. Carly Angel is the top most immunologists specialist in Crist Hospital in London, UK. ';
  final String fullText = 'Dr. Carly Angel is the top most immunologists specialist in Crist Hospital in London, UK. She has over 15 years of experience in treating autoimmune diseases and allergies. She is dedicated to providing the best care for her patients using modern technology.';

  @override
  void initState() {
    super.initState();
    // Initialize the tap recognizer and link it to our toggle function
    _readMoreRecognizer = TapGestureRecognizer()..onTap = _toggleExpanded;
  }

  @override
  void dispose() {
    // ALWAYS dispose recognizers to prevent memory leaks
    _readMoreRecognizer.dispose();
    super.dispose();
  }

  // Function to toggle the state
  void _toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppDecorations.borderRadius25,
        boxShadow: [AppDecorations.defaultShadow], 
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Section Title ---
          Text(
            'About Me',
            style: Styles.textStyle16Bold.copyWith(color: Colors.black87),
          ),
          const SizedBox(height: 12),
          
          // --- Expandable Text Section ---
          // AnimatedSize automatically animates the container when its child changes size
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: RichText(
              text: TextSpan(
                style: Styles.textStyle14.copyWith(color: kGreyColor, height: 1.5),
                children: [
                  // 1. The dynamic text (short or full based on state)
                  TextSpan(
                    text: isExpanded ? fullText : shortText,
                  ),
                  // 2. The clickable action text
                  TextSpan(
                    text: isExpanded ? ' Read Less' : 'Read More...',
                    style: Styles.textStyle14.copyWith(
                      color: kPrimaryColor, 
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: _readMoreRecognizer, // Connect the click event
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
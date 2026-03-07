import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medi_cloud_app/Core/utils/textStyles.dart';
import 'package:medi_cloud_app/constant.dart';

class CustomExpandableSection extends StatefulWidget {
  final String title;
  final String shortText;
  final String fullText;

  const CustomExpandableSection({
    super.key,
    required this.title,
    required this.shortText,
    required this.fullText,
  });

  @override
  State<CustomExpandableSection> createState() => _CustomExpandableSectionState();
}

class _CustomExpandableSectionState extends State<CustomExpandableSection> {
  bool isExpanded = false;
  late TapGestureRecognizer _readMoreRecognizer;

  @override
  void initState() {
    super.initState();
    _readMoreRecognizer = TapGestureRecognizer()..onTap = _toggleExpanded;
  }

  @override
  void dispose() {
    _readMoreRecognizer.dispose();
    super.dispose();
  }

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
          Text(
            widget.title,
            style: Styles.textStyle16Bold.copyWith(color: Colors.black87),
          ),
          const SizedBox(height: 12),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: RichText(
              text: TextSpan(
                style: Styles.textStyle14.copyWith(color: kGreyColor, height: 1.5),
                children: [
                  TextSpan(
                    text: isExpanded ? widget.fullText : widget.shortText,
                  ),
                  TextSpan(
                    text: isExpanded ? ' Read Less' : ' Read More...',
                    style: Styles.textStyle14.copyWith(
                      color: kPrimaryColor, 
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: _readMoreRecognizer,
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
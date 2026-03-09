import 'package:flutter/material.dart';
// استدعي ملف اللستة الجديد اللي لسه عاملينه
import 'package:medi_cloud_app/features/Patient%20Hospital/Presentation/view/widgets/dashboard/test_results_list_view.dart';

class TestResultsTab extends StatelessWidget {
  const TestResultsTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Very clean and modular: just returning the separated ListView component
    return const TestResultsListView();
  }
}
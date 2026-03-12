import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custome_app_bar.dart';
import 'package:medi_cloud_app/Core/utils/widgets/custom_button.dart';
import 'package:medi_cloud_app/features/Patient%20Reports/presentation/view%20model/reports_cubit.dart';
import 'package:medi_cloud_app/features/Patient%20Reports/presentation/widgets/ai_insights_section.dart';
import 'package:medi_cloud_app/features/Patient%20Reports/presentation/widgets/averages_section.dart';
import 'date_selector_section.dart';

class HealthProgressViewBody extends StatelessWidget {
  const HealthProgressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Custom App bar widget
        const CustomAppBar(
          title: 'Health Progress Report',
          textColor: kShadePrimaryColor,
        ),

        Expanded(
          child: BlocBuilder<ReportsCubit, ReportsState>(
            builder: (context, state) {
              if (state is ReportsLoading || state is ReportsInitial) {
                return const Center(
                  child: CircularProgressIndicator(color: kPrimaryColor),
                );
              }

              if (state is ReportsLoaded) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      // 2. DateCalender widget
                      DateSelectorSection(state: state),
                      //   const SizedBox(height: 24),

                      // 3. كارت الهارت ريت و HRV (كليكابل)
                      AveragesSection(state: state),
                      const SizedBox(height: 24),

                      // 4. Recommendation section
                      AiInsightsSection(insights: state.aiInsights),

                      const Spacer(),

                      // 5. Custom button للطباعة
                      CustomButton(
                        text: 'Print as a PDF',
                        backgroundColor: kPrimaryColor,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                );
              }

              return const Center(
                child: Text(
                  'Error loading report',
                  style: TextStyle(color: kDarkTextColor),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

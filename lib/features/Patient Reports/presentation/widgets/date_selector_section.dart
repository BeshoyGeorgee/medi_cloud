import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_cloud_app/constant.dart';
import 'package:medi_cloud_app/features/Patient%20Reports/presentation/view%20model/reports_cubit.dart';

class DateSelectorSection extends StatelessWidget {
  final ReportsLoaded state;
  const DateSelectorSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left, color: kDarkTextColor),
          onPressed: () => context.read<ReportsCubit>().previousWeek(),
        ),
        Text(
          state.dateRangeString,
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: kDarkTextColor),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          color: state.canGoNext ? kDarkTextColor : kGreyColor,
          onPressed: state.canGoNext ? () => context.read<ReportsCubit>().nextWeek() : null,
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:openalex/models/institution/summary_stats.dart';

class SummaryStatsCard extends StatelessWidget {
  const SummaryStatsCard({Key? key, required this.summaryStats})
      : super(key: key);

  final SummaryStats summaryStats;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('H-Index'),
          trailing: Text(summaryStats.hIndex.toString()),
        ),
        ListTile(
          title: Text('i-10 Index'),
          trailing: Text(summaryStats.i10Index.toString()),
        ),
        ListTile(
          title: Text('2 Year Mean Citedness'),
          trailing: Text(summaryStats.twoYearMeanCitedness.toString()),
        ),
      ],
    );
  }
}

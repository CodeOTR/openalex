import 'package:example/features/institutions/widgets/summary_stats_card.dart';
import 'package:flutter/material.dart';
import 'package:openalex/models/institution/institution.dart';

class InstitutionDetails extends StatelessWidget {
  const InstitutionDetails({Key? key, required this.institution})
      : super(key: key);

  final Institution institution;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Institution Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (institution.imageThumbnailUrl != null)
              Image.network(institution.imageThumbnailUrl!),
            const SizedBox(height: 12.0),
            ListTile(
              title: Text('${institution.displayName}'),
              subtitle: Text('Homepage: ${institution.homepageUrl}'),
            ),
            if ((institution.displayNameAlternatives ?? []).isNotEmpty)
              Text('Alternative Names: ${institution.displayNameAlternatives}'),
            ListTile(
              title: const Text('Country'),
              trailing: Text(institution.countryCode.toString()),
            ),
            ListTile(
              title: const Text('Cited By Count'),
              trailing: Text(institution.citedByCount.toString()),
            ),
            ListTile(
              title: const Text('Works Count'),
              trailing: Text(institution.worksCount.toString()),
            ),
            if (institution.createdDate != null)
              ListTile(
                title: const Text('Created Date'),
                trailing: Text(MaterialLocalizations.of(context)
                    .formatCompactDate(
                        DateTime.parse(institution.createdDate!))),
              ),

            SummaryStatsCard(summaryStats: institution.summaryStats!),
            // If associatedInstitutions is a List<String>, you can display them like:
            const Divider(),
            const ListTile(
              title: Text('Associated Institutions'),
            ),
            ...(institution.associatedInstitutions ?? [])
                .map((inst) => ListTile(title: Text(inst.displayName ?? '')))
                .toList(),

            // Add other fields...
          ],
        ),
      ),
    );
  }
}

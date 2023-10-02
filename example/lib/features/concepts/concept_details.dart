import 'package:flutter/material.dart';
import 'package:openalex/models/models.dart';
import 'package:openalex/openalex.dart';

class ConceptDetails extends StatelessWidget {
  const ConceptDetails({Key? key, required this.conceptId}) : super(key: key);

  final String conceptId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Concept?>(
        future: OpenAlex().getConcept(conceptId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          Concept concept = snapshot.data!;
          return Scaffold(
            appBar:
                AppBar(title: Text(concept.displayName ?? 'Concept Details')),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  if (concept.imageThumbnailUrl != null)
                    ListTile(
                      title: Image.network(concept.imageThumbnailUrl!),
                    ),
                  ListTile(
                    title: Text(
                        'Description: ${concept.description ?? 'Not provided'}'),
                  ),
                  ListTile(
                    title: Text('ID: ${concept.id ?? 'Not provided'}'),
                  ),
                  ListTile(
                    title:
                        Text('Wikidata: ${concept.wikidata ?? 'Not provided'}'),
                  ),
                  ListTile(
                    title: Text(
                        'Level: ${concept.level?.toString() ?? 'Not provided'}'),
                  ),
                  ListTile(
                    title: Text(
                        'Works Count: ${concept.worksCount?.toString() ?? 'Not provided'}'),
                  ),
                  ListTile(
                    title: Text(
                        'Created Date: ${concept.createdDate ?? 'Not provided'}'),
                  ),
                  ListTile(
                    title: Text(
                        'Updated Date: ${concept.updatedDate ?? 'Not provided'}'),
                  ),
                  // ... Continue to display other fields similarly
                  const Divider(),
                  const ListTile(
                    title: Text('Ancestors'),
                  ),
                  if (concept.ancestors != null &&
                      concept.ancestors!.isNotEmpty)
                    ...concept.ancestors!
                        .map((ancestor) => ListTile(
                            title:
                                Text(ancestor.displayName ?? 'Not provided')))
                        .toList(),
                  const Divider(),
                  const ListTile(
                    title: Text('Related Concepts'),
                  ),
                  if (concept.relatedConcepts != null &&
                      concept.relatedConcepts!.isNotEmpty)
                    ...concept.relatedConcepts!
                        .map((ancestor) => ListTile(
                            title:
                                Text(ancestor.displayName ?? 'Not provided')))
                        .toList(),

                  // Continue displaying other details...
                ],
              ),
            ),
          );
        });
  }
}

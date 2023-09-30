import 'package:example/features/concepts/concept_details.dart';
import 'package:example/features/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:openalex/models/models.dart';
import 'package:openalex/openalex.dart';

class ConceptSearch extends StatefulWidget {
  const ConceptSearch({Key? key}) : super(key: key);

  @override
  State<ConceptSearch> createState() => _ConceptSearchState();
}

class _ConceptSearchState extends State<ConceptSearch> {
  List<Concept> concepts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Concept Search')),
      body: CustomScrollView(
        slivers: [
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
            onSubmitted: (value) {
              OpenAlex().getConcepts(query: value).then((value) {
                setState(() {
                  concepts = value.concepts ?? [];
                });
              });
            },
          ).sliver(padding: 16),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList.builder(
              itemCount: concepts.length,
              itemBuilder: (context, index) {
                Concept concept = concepts[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                      shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black, width: 2)),
                      title: Text(concept.displayName ?? ''),
                      subtitle: Text(concept.description ?? ''),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ConceptDetails(
                              conceptId: concept.id!,
                            ),
                          ),
                        );
                      }),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

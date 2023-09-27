import 'package:example/features/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:openalex/models/models.dart';
import 'package:openalex/openalex.dart';

class InstitutionSearch extends StatefulWidget {
  const InstitutionSearch({Key? key}) : super(key: key);

  @override
  State<InstitutionSearch> createState() => _InstitutionSearchState();
}

class _InstitutionSearchState extends State<InstitutionSearch> {
  List<Institution> institutions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Institution Search')),
      body: CustomScrollView(
        slivers: [
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
            onSubmitted: (value) {
              OpenAlex().getInstitutions().then((value) {
                setState(() {
                  institutions = value?.institutions ?? [];
                });
              });
            },
          ).sliver(padding: 16),
          SliverList.builder(
            itemCount: institutions.length,
            itemBuilder: (context, index) {
              Institution institution = institutions[index];
              return ListTile(
                title: Text(institution.displayName ?? ''),
                subtitle: Text(institution.homepageUrl ?? ''),
              );
            },
          )
        ],
      ),
    );
  }
}

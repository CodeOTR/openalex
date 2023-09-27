import 'package:example/features/authors/author_search.dart';
import 'package:example/features/concepts/concept_search.dart';
import 'package:example/features/funders/funder_search.dart';
import 'package:example/features/home/home_view.dart';
import 'package:example/features/institutions/institution_search.dart';
import 'package:example/features/publishers/publisher_search.dart';
import 'package:example/features/sources/source_search.dart';
import 'package:example/features/works/work_search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
     colorSchemeSeed: Colors.black),
      /*
      Works: Scholarly documents like journal articles, books, datasets, and theses
Authors: People who create works
Sources: Where works are hosted (such as journals, conferences, and repositories)
Institutions: Universities and other organizations to which authors claim affiliations
Concepts: Topics assigned to works
Publishers: Companies and organizations that distribute works
Funders: Organizations that fund research
Geo: Where things are in the world
       */
      routes: {
        '/': (context) => const HomeView(),
        '/work-search': (context) => const WorkSearch(),
        '/author-search': (context) => const AuthorSearch(),
        '/source-search': (context) => const SourceSearch(),
        '/institution-search': (context) => const InstitutionSearch(),
        '/concept-search': (context) => const ConceptSearch(),
        '/publisher-search': (context) => const PublisherSearch(),
        '/funder-search': (context) => const FunderSearch(),
        '/geo-search': (context) => const InstitutionSearch(),
      },
      initialRoute: '/',
    );
  }
}

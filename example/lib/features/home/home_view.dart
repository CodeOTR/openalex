import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to OpenAlex'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          const LibraryTile(
                  title: 'Works',
                  subtitle:
                      'Scholarly documents like journal articles, books, datasets, and theses',
                  emoji: '📄',
                  path: '/work-search')
              .sliver(padding: 8),
          const LibraryTile(
                  title: 'Authors',
                  subtitle: 'People who create works',
                  emoji: '👩‍🔬',
                  path: '/author-search')
              .sliver(padding: 8),
          const LibraryTile(
                  title: 'Sources',
                  subtitle:
                      'Where works are hosted (such as journals, conferences, and repositories)',
                  path: '/source-search',
                  emoji: '📰')
              .sliver(padding: 8),
          const LibraryTile(
                  title: 'Institutions',
                  subtitle:
                      'Universities and other organizations to which authors claim affiliations',
                  path: '/institution-search',
                  emoji: '🏫')
              .sliver(padding: 8),
          const LibraryTile(
                  title: 'Concepts',
                  subtitle: 'Topics assigned to works',
                  path: '/concept-search',
                  emoji: '🧠')
              .sliver(padding: 8),
          const LibraryTile(
                  title: 'Publishers',
                  subtitle: 'Companies and organizations that distribute works',
                  path: '/publisher-search',
                  emoji: '📚')
              .sliver(padding: 8),
          const LibraryTile(
                  title: 'Funders',
                  subtitle: 'Organizations that fund research',
                  path: '/funder-search',
                  emoji: '💰')
              .sliver(padding: 8),
          const LibraryTile(
                  title: 'Geo',
                  subtitle: 'Where things are in the world',
                  path: '/geo-search',
                  emoji: '🌎')
              .sliver(padding: 8),
        ],
      ),
    );
  }
}

class LibraryTile extends StatelessWidget {
  const LibraryTile(
      {Key? key,
      required this.title,
      required this.emoji,
      required this.subtitle,
      required this.path})
      : super(key: key);

  final String title;

  final String subtitle;

  final String emoji;

  final String path;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: ListTile(
        leading: Text(emoji),
        minLeadingWidth: 0,
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: () {
          Navigator.of(context).pushNamed(path);
        },
      ),
    );
  }
}

extension SliverTools on Widget {
  Widget sliver({int? padding}) {
    if (padding == null) return SliverToBoxAdapter(child: this);

    return SliverPadding(
        padding: EdgeInsets.all(padding.toDouble()),
        sliver: SliverToBoxAdapter(child: this));
  }
}

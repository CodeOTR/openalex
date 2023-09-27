import 'package:flutter/material.dart';

class PublisherSearch extends StatelessWidget {
  const PublisherSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Publisher Search')),
      body: const Center(
        child: Text('Publisher Search'),
      ));
  }
}

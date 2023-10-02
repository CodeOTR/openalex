import 'package:flutter/material.dart';

class FunderSearch extends StatelessWidget {
  const FunderSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Funder Search')),
        body: const Center(
          child: Text('Funder Search'),
        ));
  }
}

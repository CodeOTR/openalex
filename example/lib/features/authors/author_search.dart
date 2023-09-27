import 'package:flutter/material.dart';

class AuthorSearch extends StatelessWidget {
  const AuthorSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Author Search')),
      body: const Center(
        child: Text('Author Search'),
      ),
    );
  }
}

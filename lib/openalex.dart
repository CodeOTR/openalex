library openalex;

import 'dart:convert';

import 'package:openalex/models/work/work.dart';
import 'package:http/http.dart' as http;

class OpenAlex {
  final String _url = 'https://openalex.org';

  Future<Work?> getWork(String id) async {
    http.Response response = await http.get(Uri.parse('$_url/works/$id'));

    if (response.statusCode == 200) {
      return Work.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}

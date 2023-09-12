library openalex;

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:openalex/models/author/meta_authors.dart';
import 'package:openalex/models/models.dart';

class OpenAlex {
  final String _url = 'https://openalex.org';

  /// https://docs.openalex.org/api-entities/works/get-a-single-work
  Future<Work?> getWork(String id, {List<String>? select, EntitySort? sort, bool ascending = true}) async {
    String queryString = '';

    if (select != null || sort != null) {
      queryString += '?';
      if (sort != null) queryString += 'sort=${sort.name}';
      if (select != null) {
        queryString += 'select=${select.join(',')}';

        if (!ascending) queryString += ':desc';
      }
    }

    http.Response response = await http.get(Uri.parse('$_url/works/$id$queryString'));

    if (response.statusCode == 200) {
      return Work.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  /// The best way to search for works is to use the search query parameter, which searches across titles, abstracts, and fulltext. Example:
  /// Get works with search term "dna" in the title, abstract, or fulltext:
  /// https://api.openalex.org/works?search=dna
  /// Fulltext search is powered by an index of word sequences called n-grams - see Get N-grams for more details.
  /// You can page through works and change the default number of results returned with the page and per-page parameters
  /// https://docs.openalex.org/api-entities/works/get-lists-of-works#page-and-sort-works
  Future<MetaWorks?> getWorks({
    String? query,
    int? page,
    int? perPage,
    List<String>? select,
    WorkFilter? queryFilter,
  }) async {
    String queryString = '';
  if (page != null || perPage != null || select != null || queryFilter != null || query != null) {
      queryString += '?';
      if (queryFilter != null && query != null) {
        queryString += 'filter=${queryFilter.name}.search:$query&';
      } else if(query != null) {
        queryString += 'search=$query&';
      }

      if (query != null) queryString += 'q=$query&';
      if (page != null) queryString += 'page=$page&';
      if (perPage != null) queryString += 'per-page=$perPage&';
      if (select != null) queryString += 'select=${select.join(',')}&';
    }
    http.Response response = await http.get(Uri.parse('$_url/works$queryString'));

    if (response.statusCode == 200) {
      MetaWorks works = jsonDecode(response.body);
      return works;
    } else {
      return null;
    }
  }

  /// N-grams list the words and phrases that occur in the full text of a Work. We obtain them from Internet Archive's publicly (and generously )
  /// available General Index and use them to enable fulltext searches on the Works that have them, through both the fulltext.search filter, and as an element of the more holistic search parameter.
  /// Note that while n-grams are derived from the fulltext of a Work, the presence of n-grams for a given Work doesn't imply that the fulltext is available to you, the reader.
  /// It only means the fulltext was available to Internet Archive for indexing. Work.open_access is the place to go for information on public fulltext availability.
  Future<List<NGram>> getWorkNGrams(String id) async {
    http.Response response = await http.get(Uri.parse('$_url/works/$id/ngrams'));

    if (response.statusCode == 200) {
      List<dynamic> ngrams = jsonDecode(response.body);
      return ngrams.map((e) => NGram.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  /// You can use sample to get a random batch of works.
  Future<List<Work>> getRandomWorks({int? count = 20}) async {
    http.Response response = await http.get(Uri.parse('$_url/works?sample=$count'));

    if (response.statusCode == 200) {
      List<dynamic> works = jsonDecode(response.body);
      return works.map((e) => Work.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<List<Work>> searchWorks(
    String query, {
    WorkFilter? filter,
  }) async {
    http.Response response = await http.get(Uri.parse('$_url/works/${filter != null ? 'filter=${filter.name}.' : ''}search?q=$query'));

    if (response.statusCode == 200) {
      List<dynamic> works = jsonDecode(response.body);
      return works.map((e) => Work.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  /// You can autocomplete works to create a very fast type-ahead style search function:
  /// Autocomplete works with "tigers" in the title:
  ///  https://api.openalex.org/autocomplete/works?q=tigers
  /// This returns a list of works titles with the author of each work set as the hint:
  Future<List<AutocompleteWork>> autocompleteWorks(String query) async {
    http.Response response = await http.get(Uri.parse('$_url/autocomplete/works?q=$query'));

    if (response.statusCode == 200) {
      List<dynamic> works = jsonDecode(response.body);
      return works.map((e) => AutocompleteWork.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<Author?> getAuthor(String id, {List<String>? select}) async {
    String queryString = '';

    if (select != null) {
      queryString += '?';
      queryString += 'select=${select.join(',')}';
    }

    http.Response response = await http.get(Uri.parse('$_url/authors/$id$queryString'));

    if (response.statusCode == 200) {
      return Author.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<MetaAuthors> getAuthors() async {
    http.Response response = await http.get(Uri.parse('$_url/authors'));

    if (response.statusCode == 200) {
      return MetaAuthors.fromJson(jsonDecode(response.body));
    } else {
      return MetaAuthors();
    }
  }

  Future<Concept?> getConcept(String id, {List<String>? select}) async {
    String queryString = '';

    if (select != null) {
      queryString += '?';
      queryString += 'select=${select.join(',')}';
    }

    http.Response response = await http.get(Uri.parse('$_url/concepts/$id$queryString'));

    if (response.statusCode == 200) {
      return Concept.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<MetaConcepts> getConcepts() async {
    http.Response response = await http.get(Uri.parse('$_url/concepts'));

    if (response.statusCode == 200) {
      return MetaConcepts.fromJson(jsonDecode(response.body));
    } else {
      return MetaConcepts();
    }
  }
}

enum WorkFilter {
  abstract('abstract'),
  displayName('display_name'),
  fulltext('fulltext'),
  title('title'),
  defaultFilter('default');

  const WorkFilter(this.name);

  final String name;
}

enum EntitySort {
  displayName('display_name'),
  citedByCount('cited_by_count'),
  worksCount('works_count'),
  publicationDate('publication_date'),
  relevanceScore('relevance_score');

  const EntitySort(this.name);

  final String name;
}

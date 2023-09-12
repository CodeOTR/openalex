import 'package:json_annotation/json_annotation.dart';
import 'package:openalex/models/models.dart';
import 'package:openalex/models/work/meta.dart';

part 'meta_authors.g.dart';

@JsonSerializable(explicitToJson: true)

class MetaAuthors{

Meta? meta;

List<Author>? authors;

MetaAuthors({
this.meta,
this.authors,
});


factory MetaAuthors.fromJson(Map<String, dynamic> json) => _$MetaAuthorsFromJson(json);

 Map<String, dynamic> toJson() => _$MetaAuthorsToJson(this);
 }
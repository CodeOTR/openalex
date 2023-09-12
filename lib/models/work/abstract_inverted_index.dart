import 'package:json_annotation/json_annotation.dart';

part 'abstract_inverted_index.g.dart';

@JsonSerializable(explicitToJson: true)
class AbstractInvertedIndex {
  @JsonKey(name: 'Despite')
  List<int>? despite;

  @JsonKey(name: 'growing')
  List<int>? growing;

  @JsonKey(name: 'interest')
  List<int>? interest;

  @JsonKey(name: 'in')
  List<int>? in_;

  @JsonKey(name: 'Open')
  List<int>? open;

  @JsonKey(name: 'Access')
  List<int>? access;

  AbstractInvertedIndex({
    this.despite,
    this.growing,
    this.interest,
    this.in_,
    this.open,
    this.access,
  });

  factory AbstractInvertedIndex.fromJson(Map<String, dynamic> json) => _$AbstractInvertedIndexFromJson(json);

  Map<String, dynamic> toJson() => _$AbstractInvertedIndexToJson(this);
}
/*

 {
    Despite: [
        0
    ],
    growing: [
        1
    ],
    interest: [
        2
    ],
    in: [
        3,
        57,
        73,
        110,
        122
    ],
    Open: [
        4,
        201
    ],
    Access: [
        5
    ],
    ...
}
  */

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abstract_inverted_index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbstractInvertedIndex _$AbstractInvertedIndexFromJson(
        Map<String, dynamic> json) =>
    AbstractInvertedIndex(
      despite:
          (json['Despite'] as List<dynamic>?)?.map((e) => e as int).toList(),
      growing:
          (json['growing'] as List<dynamic>?)?.map((e) => e as int).toList(),
      interest:
          (json['interest'] as List<dynamic>?)?.map((e) => e as int).toList(),
      in_: (json['in'] as List<dynamic>?)?.map((e) => e as int).toList(),
      open: (json['Open'] as List<dynamic>?)?.map((e) => e as int).toList(),
      access: (json['Access'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$AbstractInvertedIndexToJson(
        AbstractInvertedIndex instance) =>
    <String, dynamic>{
      'Despite': instance.despite,
      'growing': instance.growing,
      'interest': instance.interest,
      'in': instance.in_,
      'Open': instance.open,
      'Access': instance.access,
    };

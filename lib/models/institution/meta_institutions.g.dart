// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_institutions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaInstitutions _$MetaInstitutionsFromJson(Map<String, dynamic> json) =>
    MetaInstitutions(
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      institutions: (json['institutions'] as List<dynamic>?)
          ?.map((e) => Institution.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MetaInstitutionsToJson(MetaInstitutions instance) =>
    <String, dynamic>{
      'meta': instance.meta?.toJson(),
      'institutions': instance.institutions?.map((e) => e.toJson()).toList(),
    };

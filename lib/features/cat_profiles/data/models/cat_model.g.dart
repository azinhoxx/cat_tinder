// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatModel _$CatModelFromJson(Map<String, dynamic> json) => CatModel(
  imageUrl: json['url'] as String?,
  name: json['name'] as String?,
  altNames: json['altNames'] as String?,
  origin: json['origin'] as String?,
  description: json['description'] as String?,
  temperament: json['temperament'] as String?,
  lifeSpan: json['lifeSpan'] as String?,
  wikipediaUrl: json['wikipediaUrl'] as String?,
  weight:
      json['weight'] == null
          ? null
          : CatWeightModel.fromJson(json['weight'] as Map<String, dynamic>),
  adaptability: (json['adaptability'] as num?)?.toInt(),
  affectionLevel: (json['affectionLevel'] as num?)?.toInt(),
  childFriendly: (json['childFriendly'] as num?)?.toInt(),
  dogFriendly: (json['dogFriendly'] as num?)?.toInt(),
  energyLevel: (json['energyLevel'] as num?)?.toInt(),
  grooming: (json['grooming'] as num?)?.toInt(),
  healthIssues: (json['healthIssues'] as num?)?.toInt(),
  intelligence: (json['intelligence'] as num?)?.toInt(),
  sheddingLevel: (json['sheddingLevel'] as num?)?.toInt(),
  socialNeeds: (json['socialNeeds'] as num?)?.toInt(),
  strangerFriendly: (json['strangerFriendly'] as num?)?.toInt(),
  vocalisation: (json['vocalisation'] as num?)?.toInt(),
);

Map<String, dynamic> _$CatModelToJson(CatModel instance) => <String, dynamic>{
  'url': instance.imageUrl,
  'name': instance.name,
  'altNames': instance.altNames,
  'origin': instance.origin,
  'description': instance.description,
  'temperament': instance.temperament,
  'lifeSpan': instance.lifeSpan,
  'wikipediaUrl': instance.wikipediaUrl,
  'weight': instance.weight,
  'adaptability': instance.adaptability,
  'affectionLevel': instance.affectionLevel,
  'childFriendly': instance.childFriendly,
  'dogFriendly': instance.dogFriendly,
  'energyLevel': instance.energyLevel,
  'grooming': instance.grooming,
  'healthIssues': instance.healthIssues,
  'intelligence': instance.intelligence,
  'sheddingLevel': instance.sheddingLevel,
  'socialNeeds': instance.socialNeeds,
  'strangerFriendly': instance.strangerFriendly,
  'vocalisation': instance.vocalisation,
};

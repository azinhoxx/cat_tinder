// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_breed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatBreedModel _$CatBreedModelFromJson(Map<String, dynamic> json) =>
    CatBreedModel(
      name: json['name'] as String?,
      altNames: json['alt_names'] as String?,
      origin: json['origin'] as String?,
      description: json['description'] as String?,
      temperament: json['temperament'] as String?,
      lifeSpan: json['life_span'] as String?,
      wikipediaUrl: json['wikipedia_url'] as String?,
      weight:
          json['weight'] == null
              ? null
              : CatWeightModel.fromJson(json['weight'] as Map<String, dynamic>),
      adaptability: (json['adaptability'] as num?)?.toInt(),
      affectionLevel: (json['affection_level'] as num?)?.toInt(),
      childFriendly: (json['child_friendly'] as num?)?.toInt(),
      dogFriendly: (json['dog_friendly'] as num?)?.toInt(),
      energyLevel: (json['energy_level'] as num?)?.toInt(),
      grooming: (json['grooming'] as num?)?.toInt(),
      healthIssues: (json['health_issues'] as num?)?.toInt(),
      intelligence: (json['intelligence'] as num?)?.toInt(),
      sheddingLevel: (json['shedding_level'] as num?)?.toInt(),
      socialNeeds: (json['social_needs'] as num?)?.toInt(),
      strangerFriendly: (json['stranger_friendly'] as num?)?.toInt(),
      vocalisation: (json['vocalisation'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CatBreedModelToJson(CatBreedModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'alt_names': instance.altNames,
      'origin': instance.origin,
      'description': instance.description,
      'temperament': instance.temperament,
      'life_span': instance.lifeSpan,
      'wikipedia_url': instance.wikipediaUrl,
      'weight': instance.weight?.toJson(),
      'adaptability': instance.adaptability,
      'affection_level': instance.affectionLevel,
      'child_friendly': instance.childFriendly,
      'dog_friendly': instance.dogFriendly,
      'energy_level': instance.energyLevel,
      'grooming': instance.grooming,
      'health_issues': instance.healthIssues,
      'intelligence': instance.intelligence,
      'shedding_level': instance.sheddingLevel,
      'social_needs': instance.socialNeeds,
      'stranger_friendly': instance.strangerFriendly,
      'vocalisation': instance.vocalisation,
    };

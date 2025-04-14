// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatModel _$CatModelFromJson(Map<String, dynamic> json) => CatModel(
  id: json['id'] as String?,
  url: json['url'] as String?,
  breeds:
      (json['breeds'] as List<dynamic>?)
          ?.map(
            (e) =>
                e == null
                    ? null
                    : CatBreedModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
);

Map<String, dynamic> _$CatModelToJson(CatModel instance) => <String, dynamic>{
  'id': instance.id,
  'url': instance.url,
  'breeds': instance.breeds?.map((e) => e?.toJson()).toList(),
};

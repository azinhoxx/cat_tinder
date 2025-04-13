// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatModel _$CatModelFromJson(Map<String, dynamic> json) => CatModel(
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
  'url': instance.url,
  'breeds': instance.breeds?.map((e) => e?.toJson()).toList(),
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_liked_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatLikedModel _$CatLikedModelFromJson(Map<String, dynamic> json) =>
    CatLikedModel(
      cat: CatModel.fromJson(json['cat'] as Map<String, dynamic>),
      likedAt: DateTime.parse(json['liked_at'] as String),
    );

Map<String, dynamic> _$CatLikedModelToJson(CatLikedModel instance) =>
    <String, dynamic>{
      'cat': instance.cat.toJson(),
      'liked_at': instance.likedAt.toIso8601String(),
    };

import 'package:cat_tinder/core/utils/mapper/data_mapper.dart';
import 'package:cat_tinder/features/cat_profiles/data/models/cat_model.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_liked_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_liked_model.g.dart';

@JsonSerializable()
class CatLikedModel extends DataMapper<CatLikedEntity> {
  final CatModel cat;
  final DateTime likedAt;

  CatLikedModel({required this.cat, required this.likedAt});

  factory CatLikedModel.fromJson(Map<String, dynamic> json) =>
      _$CatLikedModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatLikedModelToJson(this);

  @override
  CatLikedEntity mapToEntity() {
    return CatLikedEntity(cat: cat.mapToEntity(), likedAt: likedAt);
  }
}

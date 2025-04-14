import 'package:cat_tinder/core/utils/mapper/data_mapper.dart';
import 'package:cat_tinder/features/cat_profiles/data/models/cat_breed_model.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_breed_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_model.g.dart';

@JsonSerializable()
class CatModel extends DataMapper<CatEntity> {
  final String? id;

  final String? url;

  final List<CatBreedModel?>? breeds;

  CatModel({this.id, this.url, this.breeds});

  factory CatModel.fromJson(Map<String, dynamic> json) =>
      _$CatModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatModelToJson(this);

  @override
  CatEntity mapToEntity() {
    final List<CatBreedEntity?>? breedsEntity =
        breeds
            ?.map(
              (CatBreedModel? catBreedModel) => catBreedModel?.mapToEntity(),
            )
            .toList();

    return CatEntity(id: id, url: url, breeds: breedsEntity);
  }
}

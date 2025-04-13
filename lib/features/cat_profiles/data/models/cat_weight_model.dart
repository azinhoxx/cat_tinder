import 'package:cat_tinder/core/utils/mapper/data_mapper.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_weight_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_weight_model.g.dart';

@JsonSerializable()
class CatWeightModel extends DataMapper<CatWeightEntity> {
  final String? imperial;
  final String? metric;

  CatWeightModel({this.imperial, this.metric});

  factory CatWeightModel.fromJson(Map<String, dynamic> json) =>
      _$CatWeightModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatWeightModelToJson(this);

  @override
  CatWeightEntity mapToEntity() {
    return CatWeightEntity(imperial: imperial, metric: metric);
  }
}

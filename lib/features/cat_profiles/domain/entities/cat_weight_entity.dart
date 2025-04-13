import 'package:equatable/equatable.dart';

class CatWeightEntity extends Equatable {
  final String? imperial;
  final String? metric;

  const CatWeightEntity({this.imperial, this.metric});

  @override
  List<Object?> get props => <Object?>[imperial, metric];
}

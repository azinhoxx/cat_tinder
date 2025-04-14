import 'package:cat_tinder/core/common_domain/entities/based_api_result/api_result_model.dart';
import 'package:equatable/equatable.dart';

abstract class BaseParamsUseCase<Type, Params> {
  Type call(Params params);
}

abstract class BaseApiParamsUseCase<Type, Params>
    extends BaseParamsUseCase<Future<ApiResultModel<Type>>, Params> {
  @override
  Future<ApiResultModel<Type>> call(Params params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object> get props => <Object>[];
}

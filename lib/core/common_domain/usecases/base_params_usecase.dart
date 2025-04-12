import 'package:cat_tinder/core/common_domain/entities/based_api_result/api_result_model.dart';
import 'package:equatable/equatable.dart';

abstract class BaseParamsUseCase<Type, Request> {
  Future<ApiResultModel<Type>> call(Request? params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

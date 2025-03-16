import 'package:flutter_hw_1/models/error_model.dart';

class ErrorHandler {
  CustomError? error;

  void setError({required CustomErrorType type, required int count}) {
    error ??= CustomError(type: type, slidesCount: count);
  }
}

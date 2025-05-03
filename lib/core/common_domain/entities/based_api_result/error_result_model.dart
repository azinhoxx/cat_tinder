import 'package:equatable/equatable.dart';

enum ErrorType { networkError, unknownError }

class ErrorResultModel extends Equatable {
  final int? statusCode;
  final String? message;
  final ErrorType? type;

  const ErrorResultModel({
    this.statusCode,
    this.message,
    this.type = ErrorType.unknownError,
  });

  @override
  List<Object?> get props => <Object?>[statusCode, message, type];
}

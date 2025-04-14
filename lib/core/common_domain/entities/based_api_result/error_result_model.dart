import 'package:equatable/equatable.dart';

class ErrorResultModel extends Equatable {
  final int? statusCode;
  final String? message;

  const ErrorResultModel({this.statusCode, this.message});

  @override
  List<Object?> get props => <Object?>[statusCode, message];
}

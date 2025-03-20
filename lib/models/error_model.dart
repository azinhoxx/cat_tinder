import 'package:flutter/material.dart';

enum CustomErrorType {
  networkError('No network connection'),
  genericError('Something went wrong');

  final String message;
  const CustomErrorType(this.message);
}

@immutable
class CustomError {
  final CustomErrorType type;
  final int slidesCount;

  const CustomError({required this.type, required this.slidesCount});
}

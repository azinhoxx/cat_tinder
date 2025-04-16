import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppPage<T> extends CustomTransitionPage<T> {
  final Color? fillColor;

  AppPage({
    required super.child,
    this.fillColor,
    super.transitionDuration = const Duration(milliseconds: 300),
    SharedAxisTransitionType type = SharedAxisTransitionType.horizontal,
  }) : super(
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           return SharedAxisTransition(
             animation: animation,
             secondaryAnimation: secondaryAnimation,
             transitionType: type,
             child: child,
           );
         },
       );
}

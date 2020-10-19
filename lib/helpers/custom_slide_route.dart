import 'package:flutter/material.dart';

class CustomSlideRoute extends PageRouteBuilder {
  final Widget child;
  final bool opaque;
  final Offset begin;
  final Offset end;
  final Curve curve;
  final Duration duration;
  CustomSlideRoute(
    this.child, {
    this.opaque = false,
    this.begin = const Offset(0.0, 1.0),
    this.end = Offset.zero,
    this.curve = Curves.easeInOut,
    this.duration = const Duration(milliseconds: 350),
  }) : super(
            transitionDuration: duration,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              final offsetAnimation = animation.drive(tween);
              return SlideTransition(position: offsetAnimation, child: child);
            },
            pageBuilder: (context, animation, secondaryAnimation) => child,
            opaque: opaque);
}

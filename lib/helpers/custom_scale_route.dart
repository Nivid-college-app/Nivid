import 'package:flutter/material.dart';

class CustomScaleRoute extends PageRouteBuilder {
  final Widget child;
  final bool opaque;
  final Alignment alignment;
  final Curve curve;
  final Duration duration;
  CustomScaleRoute(
    this.child, {
    this.opaque = false,
    this.alignment = Alignment.bottomLeft,
    this.curve = Curves.easeInOut,
    this.duration = const Duration(milliseconds: 350),
  }) : super(
            transitionDuration: duration,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation = CurvedAnimation(parent: animation, curve: curve);
              return ScaleTransition(
                  scale: animation, child: child, alignment: alignment);
            },
            pageBuilder: (context, animation, secondaryAnimation) => child,
            opaque: opaque);
}

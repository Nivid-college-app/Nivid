import 'package:flutter/material.dart';

class CustomFadeRoute extends PageRouteBuilder {
  final Widget child;
  final bool opaque;
  final Alignment alignment;
  final Curve curve;
  final Duration duration;
  CustomFadeRoute(
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
              return FadeTransition(opacity: animation, child: child);
            },
            pageBuilder: (context, animation, secondaryAnimation) => child,
            opaque: opaque);
}

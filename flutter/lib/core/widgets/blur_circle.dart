import 'dart:ui';
import 'package:flutter/material.dart';

/// Decorative blurred circle positioned relative to the Figma frame (393 wide).
/// [blur] is the Figma "Layer blur" value (Flutter sigma = blur / 2).
class BlurCircle extends StatelessWidget {
  const BlurCircle({
    super.key,
    required this.left,
    required this.top,
    required this.size,
    required this.color,
    this.blur = 64,
  });

  final double left;
  final double top;
  final Size size;
  final Color color;
  final double blur;

  static const double _designWidth = 393;

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.sizeOf(context).width / _designWidth;
    final bleed = blur * scale;

    return Positioned(
      left: left * scale - bleed,
      top: top * scale - bleed,
      child: IgnorePointer(
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: blur / 2 * scale,
            sigmaY: blur / 2 * scale,
            tileMode: TileMode.decal,
          ),
          child: Padding(
            padding: EdgeInsets.all(bleed),
            child: Container(
              width: size.width * scale,
              height: size.height * scale,
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            ),
          ),
        ),
      ),
    );
  }
}

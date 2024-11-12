import 'package:flutter/material.dart';

class ComponentIcon extends StatelessWidget {
  final double height;
  final double width;
  const ComponentIcon({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    const asset = 'assets/icons/component.png';
    return Image.asset(
      asset,
      width: width,
      height: height,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoIcon extends StatelessWidget {
  final double height;
  final double width;
  const LogoIcon({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    const assetSvg = 'assets/logos/tractian_logo.svg';
    return SvgPicture.asset(
      assetSvg,
      width: width,
      height: height,
    );
  }
}

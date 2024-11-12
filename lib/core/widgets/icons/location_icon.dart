import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocationIcon extends StatelessWidget {
  final double height;
  final double width;
  const LocationIcon({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    const assetSvg = 'assets/icons/location.svg';
    return SvgPicture.asset(
      assetSvg,
      width: width,
      height: height,
    );
  }
}

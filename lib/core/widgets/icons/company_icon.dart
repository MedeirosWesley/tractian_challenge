import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CompanyIcon extends StatelessWidget {
  final double height;
  final double width;
  const CompanyIcon({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    const assetSvg = 'assets/icons/company.svg';
    return SvgPicture.asset(
      assetSvg,
      width: width,
      height: height,
    );
  }
}

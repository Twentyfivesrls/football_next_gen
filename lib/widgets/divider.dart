import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';

class DividerWidget extends StatelessWidget{

  final double height;
  final double thickness;
  final double indent;
  final double endIndent;
  final Color color;

  const DividerWidget({
    super.key,
    this.height = 0,
    this.thickness = 0.3,
    this.indent = 0,
    this.endIndent = 0,
    this.color = black25
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: color,
    );
  }
}
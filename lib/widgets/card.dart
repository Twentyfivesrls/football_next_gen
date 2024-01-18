import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CardWidget extends StatelessWidget{

  final Color color;
  final double elevation;
  final Widget child;

  const CardWidget({
    super.key,
    this.color = white,
    this.elevation = 2,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(0),
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        elevation: elevation,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: child,
        ),
      ),
    );
  }
}
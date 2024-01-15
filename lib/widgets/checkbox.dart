import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';

class CheckboxWidget extends StatelessWidget{

  final bool isChecked;
  final Widget title;
  final Color checkColor;
  Color? borderColor = opaqueBlack25;
  final Color backgroundColor;
  final onChanged;

  CheckboxWidget({
    super.key,
    required this.isChecked,
    required this.onChanged,
    required this.title,
    this.checkColor = white,
    this.backgroundColor = primary,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: SizedBox(
            width: 20,
            height: 20,
            child: Checkbox(
                side: BorderSide(
                  color: borderColor ?? opaqueBlack25,
                ),
                checkColor: checkColor,
                fillColor: MaterialStateProperty.all(backgroundColor),
                value: isChecked,
                onChanged: onChanged,
            ),
          ),
        ),
        title
      ],
    );
  }
}
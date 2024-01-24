import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';
import '../../../../widgets/texts.dart';

class WeekdayChip extends StatelessWidget {
  final int index;
  final bool isSelected;
  final String text;
  final Color color;
  final Color textColor;
  final Function(int) onTap;

  const WeekdayChip(
      {super.key,
      required this.text,
      this.isSelected = false,
      this.color = white,
      this.textColor = black25,
      required this.onTap,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isSelected ? primary : secondary),
        child: Align(
            alignment: Alignment.center,
            child: Text12(
              text: text,
              textColor: isSelected ? white : black25,
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:football_next_gen/widgets/texts.dart';

import '../constants/colors.dart';

class ChipWidget extends StatelessWidget{

  final String text;
  final Function() onDeleted;

  const ChipWidget({super.key, required this.text, required this.onDeleted});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: secondary,
      label: Text14(text: text),
      deleteIcon: const Icon(Icons.cancel,color: black25),
      onDeleted: onDeleted,
    );
  }

}
import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/widgets/texts.dart';

class ChoiceChipListWidget extends StatelessWidget {

  final List<bool> chipsSituation;
  final List<String> textList;
  final Function(List<bool>) changeSelection;

  const ChoiceChipListWidget({super.key, required this.chipsSituation, required this.textList, required this.changeSelection});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: List<Widget>.generate(
        chipsSituation.length, (int index) {
          return SingleChoiceChip(
            onSelected: selectedFunction,
            selected: chipsSituation[index],
            currentIndex: index,
            text: textList[index],
          );
        },
      ).toList(),
    );
  }


  selectedFunction(bool selection, int selectedIndex) {
      if(!selection){
        return;
      }

      // selection is true
      // First thing, transform all the list in false
      List<bool> resultList = List.generate(chipsSituation.length, (index) =>  false);
      resultList[selectedIndex] = true;

      // here resultList is ready to send the official value to superior widget
      changeSelection(resultList);
  }

}


class SingleChoiceChip extends StatelessWidget {

  final int currentIndex;
  final Function(bool, int) onSelected;
  final bool selected;
  final String text;


  const SingleChoiceChip({
    super.key,
    required this.selected,
    required this.currentIndex,
    required this.onSelected,
    required this.text});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
        selectedColor: secondary,
        backgroundColor: white,
        label: Text14(text: text),
        selected: selected,
        onSelected: onSelectedFunction
    );
  }

  void onSelectedFunction(bool value){
    onSelected(value,currentIndex);
  }

}
import 'package:flutter/material.dart';

class DropdownMenuWidget extends StatelessWidget{

  final Function(String?)? onSelected;
  final String initialSelection;
  final List<String> list;

  const DropdownMenuWidget({super.key, required this.onSelected, required this.initialSelection, required this.list});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: DropdownMenu<String>(
        initialSelection: initialSelection,
        onSelected: onSelected,
        dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      ),
    );
  }

}
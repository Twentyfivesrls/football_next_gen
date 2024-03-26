import 'package:flutter/material.dart';
import 'package:football_next_gen/widgets/autocomplete.dart';

class AddSports extends StatelessWidget{

  final List<String> kOptions;

  const AddSports({super.key, required this.kOptions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AutocompleteWidget(
            kOptions: kOptions,
            hintText: 'hintText'
        )
      ],
    );
  }
}
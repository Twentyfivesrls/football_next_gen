import 'package:flutter/material.dart';
import 'package:football_next_gen/widgets/inputs.dart';

class SingleFieldInput extends StatelessWidget{

  TextEditingController fieldController;
  final String labelText;

  SingleFieldInput({super.key, required this.fieldController, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: InputWidget(
          controller: fieldController,
          hintText: "Inserisci il numero di campi",
          labelText: labelText,
      ),
    );
  }

}
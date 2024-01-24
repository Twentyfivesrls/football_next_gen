import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';

class TrainingRepetitionInput extends StatelessWidget{

  TextEditingController controller;
  final bool enabled;
  final String hintText;

  TrainingRepetitionInput({super.key,required this.controller, this.enabled = true, required this.hintText});

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return TextFormField(
      enabled: enabled,
      controller: controller,
      textInputAction: TextInputAction.next,
      onEditingComplete: () => node.nextFocus(),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(vertical:0,horizontal: 12),
        fillColor: enabled ? white : secondary,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: opaqueBlack25)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: opaqueBlack25)
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: opaqueBlack25),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

}
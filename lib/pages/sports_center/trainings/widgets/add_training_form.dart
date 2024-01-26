import 'package:flutter/material.dart';
import 'package:football_next_gen/widgets/inputs.dart';
import '../../../../constants/language.dart';
import '../../../../widgets/checkbox.dart';
import '../../../../widgets/texts.dart';

class AddTrainingForm extends StatelessWidget{

  TextEditingController hourController;
  TextEditingController fieldController;
  TextEditingController teamController;
  TextEditingController infoController;
  final bool isChecked;
  final Function(bool) onChanged;

  AddTrainingForm({
    super.key,
    required this.infoController,
    required this.fieldController,
    required this.teamController,
    required this.hourController,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        InputWidget(
          labelPaddingTop: 50,
          controller: teamController,
          labelText: "Squadra*",
          hintText: getCurrentLanguageValue(TEAM) ?? "",
        ),

        InputWidget(
          labelPaddingTop: 20,
          controller: hourController,
          labelText: "Ora*",
          hintText: getCurrentLanguageValue(HOUR) ?? "",
        ),

        InputWidget(
          labelPaddingTop: 20,
          controller: fieldController,
          labelText: "Campo*",
          hintText: getCurrentLanguageValue(FIELD) ?? "",
        ),

        InputWidget(
          minLines: 4,
          maxLines: 20,
          labelPaddingTop: 20,
          controller: infoController,
          labelText: getCurrentLanguageValue(INFO) ?? "",
          hintText: getCurrentLanguageValue(INFO) ?? "",
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: CheckboxWidget(
              isChecked: isChecked,
              onChanged: onChanged,
              title: Text14(
                  text: getCurrentLanguageValue(EVENT_REPETITION) ?? "",

              ),
          ),
        )
      ],
    );
  }

}
import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';
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
  final Function() onTap;
  final Function() iconOnTap;
  final bool edit;

  AddTrainingForm({
    super.key,
    required this.infoController,
    required this.fieldController,
    required this.teamController,
    required this.hourController,
    required this.isChecked,
    required this.onChanged,
    required this.edit,
    required this.onTap,
    required this.iconOnTap
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
          onTap: onTap,
          iconOnTap: iconOnTap,
          showSuffixIcon: true,
          readOnly: true,
          suffixIcon: Icons.timelapse,
          iconColor: black25,
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

        Visibility(
          visible: !edit,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CheckboxWidget(
                isChecked: isChecked,
                onChanged: onChanged,
                title: Text14(
                    text: getCurrentLanguageValue(EVENT_REPETITION) ?? "",
                ),
            ),
          ),
        )
      ],
    );
  }

}
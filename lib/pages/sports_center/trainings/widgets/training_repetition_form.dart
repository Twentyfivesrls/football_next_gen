import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_next_gen/models/weekday_element.dart';
import 'package:football_next_gen/pages/sports_center/trainings/widgets/training_repetition_input.dart';
import 'package:football_next_gen/pages/sports_center/trainings/widgets/weekday_chip.dart';
import 'package:football_next_gen/widgets/radio_buttons.dart';
import 'package:football_next_gen/widgets/texts.dart';

class TrainingRepetitionForm extends StatelessWidget {
  List<WeekdayElement> weekdays = [
    WeekdayElement(abbreviation:'L', value: 'Lunedì'),
    WeekdayElement(abbreviation:'M', value: 'Martedì'),
    WeekdayElement(abbreviation:'M', value: 'Mercoledì'),
    WeekdayElement(abbreviation:'G', value: 'Giovedì'),
    WeekdayElement(abbreviation:'V', value: 'Venerdì'),
    WeekdayElement(abbreviation:'S', value: 'Sabato'),
    WeekdayElement(abbreviation:'D', value: 'Domenica'),
  ];
  TextEditingController repetitionController;
  TextEditingController dateController;
  TextEditingController occurrenceController;
  final bool dateEnabled;
  final bool occurrenceEnabled;
  final firstOnChanged;
  final groupValue;
  final firstValue;
  final secondOnChanged;
  final secondValue;
  final thirdOnChanged;
  final thirdValue;
  final Color selectedColor;
  final Color selectedTextColor;
  final List<bool> selectedList;
  final Function(int) onTap;

  TrainingRepetitionForm({
    super.key,
    required this.repetitionController,
    required this.occurrenceController,
    required this.dateController,
    required this.groupValue,
    this.firstOnChanged,
    this.firstValue,
    this.secondOnChanged,
    this.secondValue,
    this.thirdOnChanged,
    this.thirdValue,
    this.dateEnabled = false,
    this.occurrenceEnabled = false,
    required this.selectedColor,
    required this.selectedTextColor,
    required this.selectedList,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text14(
              text: "Ripeti ogni",
              fontWeight: FontWeight.w600,
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 60,
                  height: 40,
                  child:  TrainingRepetitionInput(
                    hintText: 'N°',
                    controller: repetitionController,
                  )
              ),
              const Text14(text: "settimana/e"),
            ],
          ),

          const Padding(
            padding: EdgeInsets.only(top: 30,bottom: 10),
            child: Text14(
              text: "Si ripete",
              fontWeight: FontWeight.w600,
            ),
          ),

          Row(
            children: [
              ...weekdays.map((e) => WeekdayChip(
                text: e.abbreviation,
                onTap: onTap,
                index: weekdays.indexOf(e),
                isSelected: selectedList[weekdays.indexOf(e)],
              )),
            ],
          ),

          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text14(
              text: "Fine",
              fontWeight: FontWeight.w600,
            ),
          ),

          Column(
            children: [
              RadioButtonWidget(
                  title: 'Mai',
                  value: firstValue,
                  onChanged: firstOnChanged,
                  groupValue: groupValue
              ),

              Row(
                children: [
                  SizedBox(
                    width: 90,
                    child: RadioButtonWidget(
                        title: 'Data',
                        value: secondValue,
                        onChanged: secondOnChanged,
                        groupValue: groupValue
                    ),
                  ),

                  SizedBox(
                      width: 125,
                      height: 40,
                      child: TrainingRepetitionInput(
                        hintText: 'dd/mm/yyyy',
                        controller: dateController,
                        enabled: dateEnabled,
                      )
                  ),
                ],
              ),

              Row(
                children: [
                  SizedBox(
                    width: 96,
                    child: RadioButtonWidget(
                        title: 'Dopo',
                        value: thirdValue,
                        onChanged: thirdOnChanged,
                        groupValue: groupValue
                    ),
                  ),

                  Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 60,
                      height: 40,
                      child: TrainingRepetitionInput(
                        hintText: 'N°',
                        enabled: occurrenceEnabled,
                        controller: occurrenceController,
                      )
                  ),
                  const Text14(text: 'occorrenza/e')
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

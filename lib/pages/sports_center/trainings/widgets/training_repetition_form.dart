import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/models/training_entity.dart';
import 'package:football_next_gen/models/weekday_element.dart';
import 'package:football_next_gen/pages/sports_center/trainings/widgets/training_repetition_input.dart';
import 'package:football_next_gen/pages/sports_center/trainings/widgets/weekday_chip.dart';
import 'package:football_next_gen/widgets/radio_buttons.dart';
import 'package:football_next_gen/widgets/texts.dart';

class TrainingRepetitionForm extends StatelessWidget {
  String _getDaysAbbreviation(DaysOfWeek day) {
    switch (day) {
      case DaysOfWeek.Lunedi:
        return 'L';
      case DaysOfWeek.Martedi:
        return 'M';
      case DaysOfWeek.Mercoledi:
        return 'M';
      case DaysOfWeek.Giovedi:
        return 'G';
      case DaysOfWeek.Venerdi:
        return 'V';
      case DaysOfWeek.Sabato:
        return 'S';
      case DaysOfWeek.Domenica:
        return 'D';
    }
  }
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
  final Function() selectDate;
  final iconOnTap;


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
    required this.onTap,
    required this.selectDate,
    required this.iconOnTap
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
                    onTap: (){},
                    hintText: 'N°',
                    keyboardType: TextInputType.number,
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
              ...DaysOfWeek.values.map((day) => WeekdayChip(
                text: _getDaysAbbreviation(day),
                onTap: onTap,
                index: DaysOfWeek.values.indexOf(day),
                isSelected: selectedList[DaysOfWeek.values.indexOf(day)],
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
                      width: 150,
                      height: 40,
                      child: TrainingRepetitionInput(
                        onTap: selectDate,
                        hintText: 'dd/mm/yyyy',
                        controller: dateController,
                        enabled: dateEnabled,
                        iconOnTap: iconOnTap,
                        showSuffixIcon: true,
                        suffixIcon:  Icons.calendar_today,
                        iconColor: black25,

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
                        onTap: (){},
                        hintText: 'N°',
                        keyboardType: TextInputType.number,
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

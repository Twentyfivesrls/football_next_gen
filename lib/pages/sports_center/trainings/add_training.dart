import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/pages/sports_center/trainings/widgets/add_training_form.dart';
import 'package:football_next_gen/pages/sports_center/trainings/widgets/training_repetition_form.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/colors.dart';
import '../../../constants/language.dart';
import '../../../models/confirm_page_data.dart';
import '../../../widgets/buttons.dart';

enum RadioButtons { mai, data, dopo }

class AddTraining extends StatefulWidget{
  const AddTraining({super.key});
  @override
  State<StatefulWidget> createState() => AddTrainingState();
}

class AddTrainingState extends State<AddTraining>{

  final String date = "23/01/2024";
  bool isChecked = false;
  final TextEditingController hourController = TextEditingController();
  final TextEditingController fieldController = TextEditingController();
  final TextEditingController infoController = TextEditingController();
  final TextEditingController teamController = TextEditingController();
  final TextEditingController repetitionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController occurrenceController = TextEditingController();
  bool showRepetition = false;
  bool occurrenceEnabled = false;
  bool dateEnabled = false;
  List<bool> selected = [false,false,false,false,false,false,false];
  RadioButtons? radioValue = RadioButtons.mai;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      paddingTop: 0,
      appBar: 3,
      showTrailingIcon: false,
      title: AppPage.addTraining.toTitle,
      goHome: (){},
      goBack: (){
        context.pop();
      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerSection(),
            formSection(),
            trainingRepetitionSection(),
            buttonsSection()
          ],
        ),
      ),
    );
  }

  Widget headerSection(){
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Text20(
        text: 'Allenamento - $date',
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget formSection(){
    return AddTrainingForm(
      infoController: infoController,
      fieldController: fieldController,
      teamController: teamController,
      hourController: hourController,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          showRepetition = value;
        });
      },
      isChecked: isChecked,
    );
  }

  Widget trainingRepetitionSection(){
    return Visibility(
      visible: showRepetition,
      child: TrainingRepetitionForm(
        selectedTextColor: white,
        selectedColor: primary,
        onTap: (index){
          setState(() {
            selected[index] = !selected[index];
          });
        },
        selectedList: selected,
        occurrenceEnabled: occurrenceEnabled,
        dateEnabled: dateEnabled,
        occurrenceController: occurrenceController,
        dateController: dateController,
        repetitionController: repetitionController,
        groupValue: radioValue,
        firstOnChanged: (RadioButtons? value) {
          setState(() {
            dateEnabled = false;
            occurrenceEnabled = false;
            radioValue = value;
          });
        },
        firstValue: RadioButtons.mai,
        secondOnChanged: (RadioButtons? value) {
          setState(() {
            dateEnabled = !dateEnabled;
            occurrenceEnabled = false;
            radioValue = value;
          });
        },
        secondValue: RadioButtons.data,
        thirdOnChanged: (RadioButtons? value) {
          setState(() {
            dateEnabled = false;
            occurrenceEnabled = !occurrenceEnabled;
            radioValue = value;
          });
        },
        thirdValue: RadioButtons.dopo,
      ),
    );
  }

  Widget buttonsSection() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 50),
          child: DividerWidget(),
        ),

        ActionButton(
          onPressed: () {
            context.push(AppPage.confirmPage.path, extra: ConfirmPageData.addTrainingConfirmed(context));
          },
          text: getCurrentLanguageValue(AppPage.addTraining.toTitle) ?? "",
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ActionButton(
            onPressed: () {
              context.pop();
            },
            text: getCurrentLanguageValue(CANCEL) ?? "",
            backgroundColor: cancelGrey,
            borderColor: cancelGrey,
          ),
        )
      ],
    );
  }
}
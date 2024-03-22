import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/bloc/training/create_training_cubit.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/models/training_entity.dart';
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
import '../../../widgets/dialog.dart';

enum RadioButtons { mai, data, dopo }

class AddTraining extends StatelessWidget{
  const AddTraining({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateTrainingCubit(),
      child: const AddTrainingWidget() ,
    );
  }
}

class AddTrainingWidget extends StatefulWidget{
  const AddTrainingWidget({super.key});
  @override
  State<StatefulWidget> createState() => AddTrainingState();
}

class AddTrainingState extends State<AddTrainingWidget>{

  final String date = "23/01/2024";
  bool isChecked = false;
  final TextEditingController hourController = TextEditingController();
  final TextEditingController fieldController = TextEditingController();
  final TextEditingController infoController = TextEditingController();
  final TextEditingController teamController = TextEditingController();
  final TextEditingController repetitionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController occurrenceController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool showRepetition = false;
  bool occurrenceEnabled = false;
  bool dateEnabled = false;
  List<bool> selected = [false,false,false,false,false,false,false];
  RadioButtons? radioValue = RadioButtons.mai;

  CreateTrainingCubit get _createTrainingCubit => context.read<CreateTrainingCubit>();


  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      paddingTop: 0,
      appBar: 3,
      showFirstTrailingIcon: false,
      title: AppPage.addTraining.toTitle,
      firstTrailingIconOnTap: (){},
      secondTrailingIconOnTap: (){},
      goBack: (){
        showDialog(
            context: context,
            builder: (BuildContext context){
              return DialogWidget(
                title: 'Avviso',
                message: 'Procedendo in questo modo, tutti i dati inseriti andranno persi. Vuoi davvero annullare la creazione dell\'allenamento?',
                confirmText: 'Elimina allenamento',
                cancelText: getCurrentLanguageValue(CANCEL) ?? "",
                onConfirm: () {
                  context.go(AppPage.trainingsList.path);
                },
              );
            });
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
      child: Text18(
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
            final trainingEntity = TrainingEntity(date: DateTime.now(),
                hour: TimeOfDay.now(),
                field: fieldController.text,
                info: infoController.text, weeksToRepeat: 2, name: nameController.text);
            _createTrainingCubit.fetchCreateTraining(trainingEntity);
            context.push(AppPage.confirmPage.path, extra: ConfirmPageData.addTrainingConfirmed(context, trainingEntity.id ?? 0));
          },
          text: getCurrentLanguageValue(AppPage.addTraining.toTitle) ?? "",
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return DialogWidget(
                      title: 'Avviso',
                      message: 'Procedendo in questo modo, tutti i dati inseriti andranno persi. Vuoi davvero annullare la creazione dell\'allenamento?',
                      confirmText: 'Elimina allenamento',
                      cancelText: getCurrentLanguageValue(CANCEL) ?? "",
                      onConfirm: () {
                        context.go(AppPage.trainingsList.path);
                      },
                    );
                  });
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
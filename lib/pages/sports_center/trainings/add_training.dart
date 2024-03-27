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
import 'package:intl/intl.dart';

enum RadioButtons { mai, data, dopo }

class AddTraining extends StatelessWidget{

  final DateTime date;
  final bool edit;

  const AddTraining({super.key, required this.date, required this.edit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateTrainingCubit(),
      child: AddTrainingWidget(date: date, edit: edit),
    );
  }
}

class AddTrainingWidget extends StatefulWidget{
  final DateTime date;
  final bool edit;

  const AddTrainingWidget({super.key, required this.date, required this.edit});
  @override
  State<StatefulWidget> createState() => AddTrainingState();
}

class AddTrainingState extends State<AddTrainingWidget>{

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

  CreateTrainingCubit get _createTrainingCubit => context.read<CreateTrainingCubit>();


  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      paddingTop: 0,
      appBar: 3,
      showFirstTrailingIcon: false,
      title: widget.edit ? "Modifica allenamento" : AppPage.addTraining.toTitle,
      firstTrailingIconOnTap: (){},
      secondTrailingIconOnTap: (){},
      goBack: (){
        showDialog(
            context: context,
            builder: (BuildContext context){
              return DialogWidget(
                title: 'Avviso',
                message: widget.edit ? "Procedendo in questo modo, tutti i dati modificati andranno persi. Vuoi davvero annullare la modifica dell\'allenamento?" : 'Procedendo in questo modo, tutti i dati inseriti andranno persi. Vuoi davvero annullare la creazione dell\'allenamento?',
                confirmText: widget.edit ? 'Elimina modifiche' : 'Elimina allenamento',
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
    final formattedDate = DateFormat('dd/MM/yyyy').format(widget.date);
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Text18(
        text: 'Allenamento - $formattedDate',
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget formSection(){
    return AddTrainingForm(
      edit: widget.edit,
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
            print("Selected status of chip at index $index: ${selected[index]}");
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
            Set<DaysOfWeek> selectedDaysOfWeek = selected.asMap().entries
                .where((entry) => entry.value) // Filtra solo i giorni selezionati
                .map((entry) => DaysOfWeek.values[entry.key]) // Mappa gli indici selezionati ai valori dell'enum DayOfWeek
                .toSet();

            final trainingEntity = TrainingEntity(
              date: widget.date,
              dateEnd: DateTime.now(),
              hour: TimeOfDay.now(),
              field: fieldController.text,
              info: infoController.text,
              weeksToRepeat: 2,
              name: teamController.text,
              daysOfWeek: selectedDaysOfWeek,
            );
            _createTrainingCubit.fetchCreateTraining(trainingEntity);
            context.push(AppPage.confirmPage.path, extra: ConfirmPageData.addTrainingConfirmed(context, trainingEntity.id ?? 0, widget.edit));
          },
          text: widget.edit ? "Modifica allenamento" : getCurrentLanguageValue(AppPage.addTraining.toTitle) ?? "",
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
                      message: widget.edit ? "Procedendo in questo modo, tutti i dati modificati andranno persi. Vuoi davvero annullare la modifica dell\'allenamento?" : 'Procedendo in questo modo, tutti i dati inseriti andranno persi. Vuoi davvero annullare la creazione dell\'allenamento?',
                      confirmText: widget.edit ? 'Elimina modifiche' : 'Elimina allenamento',
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/bloc/training/trainings_bloc.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/pages/sports_center/trainings/widgets/training_card.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/table_calendar.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../constants/colors.dart';
import '../../../constants/images_constants.dart';
import '../../../constants/language.dart';
import '../../../models/training_entity.dart';
import '../../../widgets/buttons.dart';

class TrainingsList extends StatelessWidget{
  const TrainingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TrainingsCubit(),
      child: const TrainingsListWidget(),
    );
  }
}

class TrainingsListWidget extends StatefulWidget {
  const TrainingsListWidget({super.key});
  @override
  State<StatefulWidget> createState() => TrainingListState();
}

class TrainingListState extends State<TrainingsListWidget> {

  TrainingsCubit get _trainingsCubit => context.read<TrainingsCubit>();

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  DateTime kFirstDay = DateTime.now();


  @override
  void initState() {
    _trainingsCubit.fetchTrainings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kLastDay =
    DateTime(kFirstDay.year + 50, kFirstDay.month, kFirstDay.day);
    return ScaffoldWidget(
      appBar: 2,
      paddingTop: 0,
      title: AppPage.trainingsList.toTitle,
      firstTrailingIcon: Icons.home,
      firstTrailingIconOnTap: () {
        context.go(AppPage.homeSportsCenter.path);
      },
      secondTrailingIconOnTap: (){},
      goBack: () {},
      body: SingleChildScrollView(
        child: BlocBuilder<TrainingsCubit,TrainingsPageState>(
            builder: (_,state) {
              if(state is TrainingsPageLoading){
                return const Center(child: CircularProgressIndicator());
              }
              else if(state is TrainingsPageLoaded){
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: filters(),
                    ),
                    TableCalendarWidget(
                      kFirstDay: kFirstDay,
                      kLastDay: kLastDay,
                      focusedDay: _focusedDay,
                      onPageChanged: (focusedDay) {
                        _focusedDay = focusedDay;
                      },
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        if (!isSameDay(_selectedDay, selectedDay)) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                          });
                        }
                      },
                    ),
                    newTrainingButtonSection(),

                    ...state.trainings.map((e) => trainingList(e)),

                  ],
                );
              }
              else{
                // here the state is error
                return Center(
                  child: Text18(
                    text: (state as TrainingsPageError).error.toString(),
                  ),
                );
              }
            }
        )
      ),
    );
  }


  Widget newTrainingButtonSection() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: DividerWidget(),
        ),
        ActionButton(
          onPressed: () {
            context.push(AppPage.addTraining.path);
          },
          text: getCurrentLanguageValue(ADD_TRAINING) ?? "",
          backgroundColor: white,
          borderColor: textProfileGrey,
          rowLayout: false,
          height: 114,
          showPrefixIcon: true,
          textColor: textProfileGrey,
          svgPrefixIcon: ImagesConstants.addCircleImg,
        ),
      ],
    );
  }

  Widget filters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            context.push(AppPage.filters.path);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text14(
              text: getCurrentLanguageValue(FILTERS) ?? "",
              textColor: primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SvgPicture.asset(ImagesConstants.filterImg)
      ],
    );
  }

  Widget trainingList (TrainingEntityDtoForList training){
    return TrainingCard(
      training: training,
      goToDetail: (){
        context.push(AppPage.trainingDetail.path, extra: training.id);
      },
    );
  }
}

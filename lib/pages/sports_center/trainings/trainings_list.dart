import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

class TrainingsList extends StatefulWidget {
  const TrainingsList({super.key});

  @override
  State<StatefulWidget> createState() => TrainingListState();
}

class TrainingListState extends State<TrainingsList> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  DateTime kFirstDay = DateTime.now();
  final String teamName = "US Tigri Tuonanti";
  final List<TrainingEntity> trainings = [
    TrainingEntity(name: 'name', date: 'date', hour: '13:30', field: '3A', info: 'info'),
    TrainingEntity(name: 'name', date: 'date', hour: '13:30', field: '3A', info: 'info'),
    TrainingEntity(name: 'name', date: 'date', hour: '13:30', field: '3A', info: 'info'),
    TrainingEntity(name: 'name', date: 'date', hour: '13:30', field: '3A', info: 'info'),
  ];

  @override
  Widget build(BuildContext context) {
    final kLastDay =
    DateTime(kFirstDay.year + 50, kFirstDay.month, kFirstDay.day);
    return ScaffoldWidget(
      appBar: 2,
      paddingTop: 0,
      title: AppPage.trainingsList.toTitle,
      trailingIcon: Icons.home,
      goHome: () {
        context.go(AppPage.homeSportsCenter.path);
      },
      goBack: () {},
      body: SingleChildScrollView(
        child: Column(
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

            ...trainings.map((e) => trainingList(e)),

          ],
        ),
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

  Widget trainingList (TrainingEntity training){
    return TrainingCard(
      name: teamName,
      training: training,
      goToDetail: (){
        context.push(AppPage.trainingDetail.path);
      },
    );
  }
}

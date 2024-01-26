import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/models/training_entity.dart';
import 'package:football_next_gen/widgets/info_box.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/colors.dart';
import '../../../constants/images_constants.dart';
import '../../../constants/language.dart';
import '../../../widgets/texts.dart';

class TrainingDetail extends StatefulWidget {
  const TrainingDetail({super.key});

  @override
  State<StatefulWidget> createState() => TrainingDetailState();

}

class TrainingDetailState extends State<TrainingDetail> {


  final TrainingEntity training = TrainingEntity(
      name: 'US Tigri Tuonanti',
      date: '!3/08/2024',
      hour: '13:30',
      field: '3A',
      info: 'L’allenamento si svolgerà in questo campo indipendentemente dalle condizioni meteo'
  );

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      paddingTop: 30,
      title: AppPage.trainingDetail.toTitle,
      trailingIcon: Icons.home,
      appBar: 3,
      goHome: () {
        context.go(AppPage.homeSportsCenter.path);
      },
      goBack: () {
        context.go(AppPage.trainingsList.path);
      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            editSection(),
            trainingDetailInfo()
          ],
        ),
      ),
    );
  }


  Widget editSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text18(
          text: getCurrentLanguageValue(INFO) ?? "",
          textColor: primary,
        ),

        GestureDetector(
          onTap: () {
            context.push(AppPage.addTeam.path);
          },
          child: SvgPicture.asset(
              ImagesConstants.editImg
          ),
        )
      ],
    );
  }


  Widget trainingDetailInfo() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: InfoBoxWidget(labelText: getCurrentLanguageValue(TEAM) ?? "",
              showIcon: false,
              text: training.name),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: InfoBoxWidget(labelText: getCurrentLanguageValue(DATE) ?? "",
              showIcon: false,
              text: training.date),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: InfoBoxWidget(labelText: getCurrentLanguageValue(HOUR) ?? "",
              showIcon: false,
              text: training.hour),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: InfoBoxWidget(labelText: getCurrentLanguageValue(FIELD) ?? "",
            showIcon: false,
            text: training.field),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: InfoBoxWidget(labelText: getCurrentLanguageValue(INFO) ?? "",
            showIcon: false,
            text:training.info),
        ),

      ],
    );
  }
}
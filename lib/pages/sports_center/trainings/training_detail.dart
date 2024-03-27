import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_next_gen/bloc/training/full_training_bloc.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/models/training_entity.dart';
import 'package:football_next_gen/widgets/info_box.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/colors.dart';
import '../../../constants/images_constants.dart';
import '../../../constants/language.dart';
import '../../../widgets/texts.dart';

import 'package:intl/intl.dart';

class TrainingDetail extends StatelessWidget{

  final int id;
  const TrainingDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FullTrainingCubit(),
      child: TrainingDetailWidget(id: id),
    );
  }
}


class TrainingDetailWidget extends StatefulWidget {

  final int id;
  const TrainingDetailWidget({super.key, required this.id});

  @override
  State<StatefulWidget> createState() => TrainingDetailState();

}

class TrainingDetailState extends State<TrainingDetailWidget> {

  FullTrainingCubit get _trainingCubit => context.read<FullTrainingCubit>();

  @override
  void initState() {
    _trainingCubit.fetchTraining(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      paddingTop: 30,
      title: AppPage.trainingDetail.toTitle,
      firstTrailingIcon: Icons.home,
      appBar: 3,
      firstTrailingIconOnTap: () {
        context.go(AppPage.homeSportsCenter.path);
      },
      secondTrailingIconOnTap: (){},
      goBack: () {
        context.go(AppPage.trainingsList.path);
      },
      body: SingleChildScrollView(
          child: BlocBuilder<FullTrainingCubit,FullTrainingPageState>(
              builder: (_,state) {
                if(state is FullTrainingPageLoading){
                  return const Center(child: CircularProgressIndicator());
                }
                else if(state is FullTrainingPageLoaded){
                  return  Column(
                    children: [
                      editSection(state.training.date),
                      trainingDetailInfo(state.training)
                    ],
                  );
                }
                else{
                  // here the state is error
                  return Center(
                    child: Text18(
                      text: (state as FullTrainingPageError).error.toString(),
                    ),
                  );
                }
              }

          )
      ),
    );
  }


  Widget editSection(DateTime date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text18(
          text: getCurrentLanguageValue(INFO) ?? "",
          textColor: primary,
        ),

        GestureDetector(
          onTap: () {
            context.push(AppPage.addTraining.path, extra: {"date": date, "edit": true});
          },
          child: SvgPicture.asset(
              ImagesConstants.editImg
          ),
        )
      ],
    );
  }


  Widget trainingDetailInfo(TrainingEntity training) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: InfoBoxWidget(labelText: getCurrentLanguageValue(TEAM) ?? "",
              showIcon: false,
              text: training.name ?? ""),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: InfoBoxWidget(labelText: getCurrentLanguageValue(DATE) ?? "",
              showIcon: false,
              text: DateFormat('dd/MM/yyyy').format(training.date)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: InfoBoxWidget(labelText: getCurrentLanguageValue(HOUR) ?? "",
              showIcon: false,
              text: "${training.hour.hour}:${training.hour.minute}"),
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
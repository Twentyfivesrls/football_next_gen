import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_next_gen/constants/language.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/images_constants.dart';
import '../../../../models/training_entity.dart';
import '../../../../widgets/texts.dart';

class TrainingCard extends StatelessWidget{

  final TrainingEntity training;
  final Function() goToDetail;
  final Function() editTraining;
  final Function() deleteTraining;

  const TrainingCard({super.key, required this.training, required this.goToDetail, required this.editTraining, required this.deleteTraining});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 178,
      padding: const EdgeInsets.only(top: 30),
      child: GestureDetector(
        onTap: goToDetail,
        child: Card(
          margin: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          color: primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: PopupMenuButton(
                    padding: const EdgeInsets.only(right: 10),
                    elevation: 5,
                    splashRadius: 1,
                    icon: const Icon(Icons.more_vert,color: white,),
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      PopupMenuItem(
                          onTap: editTraining,
                          value: getCurrentLanguageValue(EDIT),
                          child: Text14(text: getCurrentLanguageValue(EDIT) ?? "")
                      ),
                      PopupMenuItem(
                          onTap: deleteTraining,
                          value: getCurrentLanguageValue(DELETE),
                          child: Text14(text: getCurrentLanguageValue(DELETE) ?? "")
                      ),
                    ],
                  )
              ),

              SvgPicture.asset(ImagesConstants.exerciseImg,width: 30, height: 30,),



              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text18(text: training.name ?? "",textColor: white,),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10,),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text14(text: getCurrentLanguageValue(HOUR) ?? "",textColor: white,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text14(text: '${training.hour.hour}:${training.hour.minute}',textColor: white,fontWeight: FontWeight.w600,),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text14(text: getCurrentLanguageValue(FIELD) ?? "",textColor: white,),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text14(text: training.field,textColor: white,fontWeight: FontWeight.w600,),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
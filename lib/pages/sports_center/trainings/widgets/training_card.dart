import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_next_gen/constants/language.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/images_constants.dart';
import '../../../../models/training_entity.dart';
import '../../../../widgets/texts.dart';

class TrainingCard extends StatelessWidget{

  final TrainingEntity training;
  final String name;
  final Function() goToDetail;

  const TrainingCard({super.key, required this.training, required this.goToDetail, required this.name});
  @override
  Widget build(BuildContext context) {
   return Container(
      height: 168,
      margin: const EdgeInsets.only(top: 30),
      child: GestureDetector(
        onTap: goToDetail,
        child: Card(
          margin: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          color: primary,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                        Icons.more_vert,
                        color: white
                    )
                ),

                SvgPicture.asset(ImagesConstants.exerciseImg,width: 30, height: 30,),



                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text20(text: name,textColor: white,),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Text16(text: getCurrentLanguageValue(HOUR) ?? "",textColor: white,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text16(text: training.hour,textColor: white,fontWeight: FontWeight.w600,),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text16(text: getCurrentLanguageValue(FIELD) ?? "",textColor: white,),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text16(text: training.field,textColor: white,fontWeight: FontWeight.w600,),
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
      ),
    );
  }

}
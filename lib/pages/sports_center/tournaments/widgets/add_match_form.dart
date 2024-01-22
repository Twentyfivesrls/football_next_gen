import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/widgets/inputs.dart';
import 'package:football_next_gen/widgets/texts.dart';

import '../../../../widgets/divider.dart';

class AddMatchForm extends StatelessWidget{

  TextEditingController homeTeamController;
  TextEditingController awayTeamController;
  TextEditingController placeController;
  TextEditingController dateController;
  TextEditingController hourController;
  final String matchTitle;
  final Function() addNewTeam;
  final Function() deleteMatch;
  final bool cancellable;


  AddMatchForm({
    super.key,
    required this.matchTitle,
    required this.awayTeamController,
    required this.homeTeamController,
    required this.placeController,
    required this.dateController,
    required this.hourController,
    required this.addNewTeam,
    this.cancellable = false,
    required this.deleteMatch
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextH1(text: matchTitle),
              Visibility(
                  visible: cancellable,
                  child:  GestureDetector(
                      onTap: deleteMatch,
                      child: SvgPicture.asset(ImagesConstants.closeImg)
                  ))
            ],
          ),


          InputWidget(
            labelPaddingTop: 40,
            controller: homeTeamController,
            labelText: getCurrentLanguageValue(HOME_TEAM) ?? "",
            hintText: getCurrentLanguageValue(HOME_TEAM) ?? "",
          ),

          InputWidget(
            labelPaddingTop: 30,
            controller: awayTeamController,
            labelText: getCurrentLanguageValue(AWAY_TEAM) ?? "",
            hintText: getCurrentLanguageValue(AWAY_TEAM) ?? "",
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: SvgPicture.asset(ImagesConstants.addCircleBlueImg),
                ),

                NavigationText(
                  text: getCurrentLanguageValue(ADD_NEW_TEAM) ?? "",
                  fontWeight: FontWeight.w600,
                  onTap: addNewTeam,
                )
              ],
            ),
          ),

          InputWidget(
            labelPaddingTop: 30,
            controller: placeController,
            labelText: getCurrentLanguageValue(PLACE) ?? "",
            hintText: getCurrentLanguageValue(PLACE) ?? "",
          ),
          InputWidget(
            labelPaddingTop: 30,
            controller: dateController,
            labelText: getCurrentLanguageValue(DATE) ?? "",
            hintText: getCurrentLanguageValue(DATE) ?? "",
          ),
          InputWidget(
            labelPaddingTop: 30,
            controller: hourController,
            labelText: getCurrentLanguageValue(HOUR) ?? "",
            hintText: getCurrentLanguageValue(HOUR) ?? "",
          ),

          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: DividerWidget(),
          ),


        ],
      ),
    );
  }

}
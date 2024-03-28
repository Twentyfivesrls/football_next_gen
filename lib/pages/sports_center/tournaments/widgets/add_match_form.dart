import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/models/team_entity.dart';
import 'package:football_next_gen/widgets/autocomplete.dart';
import 'package:football_next_gen/widgets/generic_autocomplete.dart';
import 'package:football_next_gen/widgets/inputs.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:football_next_gen/widgets/utilities/autocomplete_element.dart';

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
  final Function() onTap;
  final Function() iconOnTap;
  final Function() dateOnTap;
  final Function() dateIconOnTap;
  final bool cancellable;
  final Function(AutocompleteElement) onSelected;
  final List<TeamEntity> kOptions;


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
    required this.deleteMatch,
    required this.onTap,
    required this.iconOnTap,
    required this.dateOnTap,
    required this.dateIconOnTap,
    required this.onSelected,
    required this.kOptions
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

          GenericAutocomplete<TeamEntity>(
              kOptions: kOptions,
              hintText: "hintText",
              labelText: "labeltext",
              onSelected: onSelected,
          ),


          InputWidget(
            labelPaddingTop: 40,
            controller: homeTeamController,
            labelText: getCurrentLanguageValue(HOME_TEAM) ?? "",
            hintText: getCurrentLanguageValue(HOME_TEAM) ?? "",
          ),

          InputWidget(
            labelPaddingTop: 20,
            controller: awayTeamController,
            labelText: getCurrentLanguageValue(AWAY_TEAM) ?? "",
            hintText: getCurrentLanguageValue(AWAY_TEAM) ?? "",
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
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
            labelPaddingTop: 20,
            controller: placeController,
            labelText: getCurrentLanguageValue(PLACE) ?? "",
            hintText: getCurrentLanguageValue(PLACE) ?? "",
          ),

          InputWidget(
            controller: dateController,
            hintText: getCurrentLanguageValue(DATE) ?? "",
            labelText: getCurrentLanguageValue(DATE) ?? "",
            labelPaddingTop: 20,
            showSuffixIcon: true,
            suffixIcon: Icons.calendar_today,
            iconOnTap: dateIconOnTap,
            readOnly: true,
            onTap: dateOnTap,
            iconColor: black25,

          ),

          InputWidget(
            labelPaddingTop: 20,
            controller: hourController,
            labelText: "Ora*",
            hintText: getCurrentLanguageValue(HOUR) ?? "",
            onTap: onTap,
            iconOnTap: iconOnTap,
            showSuffixIcon: true,
            readOnly: true,
            suffixIcon: Icons.timelapse,
            iconColor: black25,
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
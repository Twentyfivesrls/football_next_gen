import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/models/tournament.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/images_constants.dart';
import '../../../../widgets/info_box.dart';
import '../../../../widgets/texts.dart';

class TournamentInfo extends StatelessWidget{
  final Function() edit;

  final TournamentEntity tournament;

  const TournamentInfo({
    super.key,
    required this.edit,
    required this.tournament
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20,top: 30,bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text18(
                text: getCurrentLanguageValue(INFO) ?? "",
                textColor: primary,
              ),

              GestureDetector(
                onTap: edit,
                child: SvgPicture.asset(ImagesConstants.editImg),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InfoBoxWidget(
              text: tournament.typology,
              showIcon: false,
              labelText: getCurrentLanguageValue(TYPOLOGY) ?? "",
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InfoBoxWidget(
              text: tournament.category,
              showIcon: false,
              labelText: getCurrentLanguageValue(CATEGORY) ?? "",
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InfoBoxWidget(
              text: tournament.phone,
              showIcon: false,
              labelText: getCurrentLanguageValue(PHONE_CONTACT) ?? "",
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InfoBoxWidget(
              text: tournament.email,
              showIcon: false,
              labelText: getCurrentLanguageValue(EMAIL_CONTACT) ?? "",
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InfoBoxWidget(
              text: tournament.rules,
              showIcon: false,
              labelText: getCurrentLanguageValue(RULES) ?? "",
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InfoBoxWidget(
              text: tournament.info,
              showIcon: false,
              labelText: getCurrentLanguageValue(OTHER_INFO) ?? "",
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(top: 30,bottom: 5),
            child: Text14(
              text: getCurrentLanguageValue(POSTER) ?? "",
              fontWeight: FontWeight.w600,
            ),
          ),

          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ),
            child: Image.asset('assets/images/frango.jpeg',fit: BoxFit.fitWidth),

          )


        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:football_next_gen/models/child_profile_entity.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/info_box.dart';
import 'package:football_next_gen/widgets/texts.dart';
import '../../../../constants/language.dart';

class Career extends StatelessWidget{
  final ChildProfileEntity profile;

  const Career({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,left: 20, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text18(
            text: getCurrentLanguageValue(CAREER) ?? "",
            textColor: primary,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InfoBoxWidget(
              text: profile.career,
              svgIcon: ImagesConstants.careerImg,
              labelText: getCurrentLanguageValue(SEASON_PLAYED) ?? "",
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: DividerWidget(),
          )
        ],
      ),
    );
  }
}
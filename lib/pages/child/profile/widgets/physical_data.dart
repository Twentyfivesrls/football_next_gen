import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/models/child_profile_entity.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/info_box.dart';
import 'package:football_next_gen/widgets/texts.dart';

class PhysicalData extends StatelessWidget{
  final ChildProfileEntity profile;

  const PhysicalData({
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
            text: getCurrentLanguageValue(PHYSICAL_DATA) ?? "",
            textColor: primary,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InfoBoxWidget(
              text: "${profile.height} cm",
              svgIcon: ImagesConstants.heightImg,
              labelText: getCurrentLanguageValue(HEIGHT) ?? "",
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InfoBoxWidget(
              text: "${profile.weight} kg",
              svgIcon: ImagesConstants.weightImg,
              labelText: getCurrentLanguageValue(WEIGHT) ?? "",
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InfoBoxWidget(
              text: profile.favoriteFoot,
              svgIcon: ImagesConstants.favoriteFootImg,
              labelText: getCurrentLanguageValue(FAVORITE_FOOT) ?? "",
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
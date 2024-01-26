import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/models/sport.dart';
import 'package:football_next_gen/widgets/texts.dart';
import '../../../../constants/language.dart';
import '../../../../widgets/divider.dart';
import '../../../../widgets/info_box.dart';

class ProfileSports extends StatelessWidget{

  final Function() editSports;
  final List<SportEntity> sports;

  const ProfileSports({
    super.key,
    required this.editSports,
    required this.sports,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,top: 30,left: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text18(
                text: getCurrentLanguageValue(SPORTS) ?? "",
                textColor: primary,
              ),

              GestureDetector(
                onTap: editSports,
                child: SvgPicture.asset(ImagesConstants.editImg),
              )
            ],
          ),

          Column(
            children: sports.map((e) => sport(e)).toList(),
          ),

      const Padding(
        padding: EdgeInsets.only(top: 30),
        child: DividerWidget(),)
        ]
      ),
    );
  }


  Widget sport(SportEntity sport){
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: InfoBoxWidget(labelText: sport.name, svgIcon: sport.svgIcon, showBottomText: false)
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/widgets/texts.dart';
import '../../../../constants/language.dart';

class Maps extends StatelessWidget{

  final Function() editMap;
  final Function() viewMap;

  const Maps({
    super.key,
    required this.editMap,
    required this.viewMap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text18(
                text: getCurrentLanguageValue(MAP) ?? "",
                textColor: primary,
              ),

              GestureDetector(
                onTap: editMap,
                child: SvgPicture.asset(ImagesConstants.editImg),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: NavigationText(
                text: getCurrentLanguageValue(MAP_TITLE) ?? "",
                onTap: viewMap
            ),
          )
        ],
      ),
    );
  }

}
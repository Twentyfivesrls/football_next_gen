import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/widgets/info_box.dart';
import 'package:football_next_gen/widgets/texts.dart';

class Registry extends StatelessWidget{
  final String date;
  final String username;

  const Registry({super.key, required this.date, required this.username});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 20,left: 20, top: 30),
      child: Column(
        children: [
          Text18(
            text: getCurrentLanguageValue(CONTACTS) ?? "",
            textColor: primary,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InfoBoxWidget(
              text: date,
              svgIcon: ImagesConstants.locationImg,
              labelText: getCurrentLanguageValue(ADDRESS) ?? "",
            ),
          ),
        ],
      ),
    );
  }
}
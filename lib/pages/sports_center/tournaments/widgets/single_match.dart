import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/models/match_entity.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/info_box.dart';
import 'package:football_next_gen/widgets/texts.dart';
import '../../../../constants/language.dart';

class SingleMatch extends StatelessWidget {
  final MatchEntity match;

  const SingleMatch({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text18(text: match.title, textColor: primary),
              SvgPicture.asset(ImagesConstants.editImg)
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                  alignment: Alignment.center,
                  child: Text14(
                    text: match.homeTeam,
                    textAlign: TextAlign.center,
                  )),
            ),
          ),
        ),
        const Text18(text: "VS", textColor: primary),

        Container(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                  alignment: Alignment.center,
                  child: Text14(
                    text: match.awayTeam,
                    textAlign: TextAlign.center,
                  )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: InfoBoxWidget(
            showIcon: false,
            labelText: getCurrentLanguageValue(DATE) ?? "",
            text: match.date,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: InfoBoxWidget(
            showIcon: false,
            labelText: getCurrentLanguageValue(HOUR) ?? "",
            text: match.hour,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: InfoBoxWidget(
            showIcon: false,
            labelText: getCurrentLanguageValue(PLACE) ?? "",
            text: match.place,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: DividerWidget(),
        ),
      ],
    );
  }
}

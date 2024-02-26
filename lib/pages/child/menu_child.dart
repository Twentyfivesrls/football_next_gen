import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/card.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';

class MenuChild extends StatefulWidget{
  const MenuChild({super.key});
  @override
  State<StatefulWidget> createState() => MenuChildState();
}


class MenuChildState extends State<MenuChild>{

  final String name = "Luigi Rossi";

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      firstTrailingIconOnTap: (){
        context.go(AppPage.homeChild.path);
      },
      secondTrailingIconOnTap: (){
        context.push(AppPage.settings.path);
      },
      goBack: (){},
      appBar: 3,
      showBackIcon: false,
      showSecondTrailingIcon: true,
      firstTrailingIcon: Icons.home,
      secondTrailingIcon: Icons.settings,
      body:  Column(
        children: [
          profileSection(),
          buttonsSection()
        ],
      )
    );
  }

  Widget profileSection(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: (){
          context.push(AppPage.childProfile.path);
        },
        child: CardWidget(
            child: Row(
              children: [
                SvgPicture.asset(ImagesConstants.childImg,height: 60,width: 60,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text18(text: name),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text14(text: getCurrentLanguageValue(VIEW_PROFILE) ?? ""),
                      ),
                    ],
                  ),
                )
              ],
            )
        ),
      ),
    );
  }

  Widget buttonsSection(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ActionButton(
            onPressed: (){
              context.push(AppPage.tournamentsList.path);
            },
            text: getCurrentLanguageValue(EVENTS) ?? "",
            rowLayout: false,
            showPrefixIcon: true,
            svgPrefixIcon: ImagesConstants.eventsImg,
            height: 114,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ActionButton(
            onPressed: (){
              context.push(AppPage.trainingsList.path);
            },
            text: getCurrentLanguageValue(EXERCISES) ?? "",
            rowLayout: false,
            showPrefixIcon: true,
            svgPrefixIcon: ImagesConstants.exerciseImg,
            height: 114,
          ),
        ),
        ActionButton(
          onPressed: (){
            context.push(AppPage.teamsList.path);
          },
          text: getCurrentLanguageValue(TEAMS) ?? "",
          rowLayout: false,
          showPrefixIcon: true,
          svgPrefixIcon: ImagesConstants.teamsImg,
          height: 114,
        ),
      ],
    );
  }
}
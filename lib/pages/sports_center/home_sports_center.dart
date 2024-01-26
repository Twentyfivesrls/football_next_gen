import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/widgets/card.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';
import '../../constants/app_pages.dart';
import '../../constants/images_constants.dart';
import '../../constants/language.dart';
import '../../widgets/buttons.dart';

class HomeSportsCenter extends StatefulWidget{
  const HomeSportsCenter({super.key});
  @override
  State<StatefulWidget> createState() => HomeSportsCenterState();
}
class HomeSportsCenterState extends State<HomeSportsCenter>{

  final TextEditingController searchController = TextEditingController();
  final String sportsCenterName = "Sport Center srl";

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        goHome: (){
          context.push(AppPage.settings.path);
        },
        goBack: (){},
        appBar: 2,
        paddingTop: 30,
      //  showSearchInput: true,
        showBackIcon: false,
      //  searchController: searchController,
      //  hintText: 'egg',
        body: Column(
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
          context.push(AppPage.sportsCenterProfile.path);
        },
        child: CardWidget(
            child: Row(
              children: [
                SvgPicture.asset(ImagesConstants.sportsCenterProfileImg,height: 60,width: 60,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text18(text: sportsCenterName),
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
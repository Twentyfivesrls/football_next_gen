import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/widgets/info_box.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';

class TeamDetail extends StatefulWidget{
  const TeamDetail({super.key});
  @override
  State<StatefulWidget> createState() => TeamDetailState();

}

class TeamDetailState extends State<TeamDetail>{

  String manager = 'Laura Bianchi';
  String coach = 'Marco Rossi';
  String description = 'La US Tigri Tuonanti è una squadra appassionata di calcio che promuove valori di fair play e impegno. Sotto la guida dell\'allenatore Marco Rossi e con il supporto del dirigente Laura Bianchi, puntiamo a eccellere in ogni partita.';
  String name = 'US Tigri Tuonanti';

  @override
  Widget build(BuildContext context) {
   return ScaffoldWidget(
       goBack: (){
         context.go(AppPage.teamsList.path);
       },
       goHome: (){
         context.go(AppPage.homeSportsCenter.path);
       },
     paddingTop: 30,
     trailingIcon: Icons.home,
     showBackIcon: true,
     appBar: 3,
     title: AppPage.teamDetail.toTitle,
     body: SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           editSection(),
           infoSection()
         ],
       ),
     )
   );
  }


  Widget editSection(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text18(
          text: getCurrentLanguageValue(INFO) ??"",
          textColor: primary,
        ),

        GestureDetector(
          onTap: (){
            context.push(AppPage.addTeam.path);
            },
          child: SvgPicture.asset(
              ImagesConstants.editImg
          ),
        )
      ],
    );
  }

  Widget infoSection(){
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text14(
              text: getCurrentLanguageValue(LOGO) ?? "",
            fontWeight: FontWeight.w600,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: SvgPicture.asset(
                ImagesConstants.teamLogoImg,
                height: 150,
                 width: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InfoBoxWidget(
                labelText: getCurrentLanguageValue(TEAM_NAME) ?? "",
                showIcon: false,
                showBottomText: true,
                text: name,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InfoBoxWidget(
              labelText: getCurrentLanguageValue(COACH) ?? "",
              showIcon: false,
              showBottomText: true,
              text: coach,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InfoBoxWidget(
              labelText: getCurrentLanguageValue(MANAGER) ?? "",
              showIcon: false,
              showBottomText: true,
              text: manager,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InfoBoxWidget(
              labelText: getCurrentLanguageValue(DESCRIPTION) ?? "",
              showIcon: false,
              showBottomText: true,
              text: description,
            ),
          ),
        ],
      ),
    );
  }

}
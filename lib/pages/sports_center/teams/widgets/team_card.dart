import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/models/team_entity.dart';
import 'package:football_next_gen/widgets/texts.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/language.dart';

class TeamCard extends StatelessWidget{

  final TeamEntityDtoForList team;
  final Function() goToDetail;

  const TeamCard({super.key, required this.team, required this.goToDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 168,
      padding: const EdgeInsets.only(top: 30),
      child: GestureDetector(
        onTap: goToDetail,
        child: Card(
          margin: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          color: primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [




              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Visibility(
                    visible: team.isHomeTeam,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SvgPicture.asset(ImagesConstants.homeTeamImg),
                    ),
                  ),


                   PopupMenuButton(
                        elevation: 5,
                        splashRadius: 1,
                        icon: const Icon(Icons.more_vert,color: white,),
                        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                          PopupMenuItem(
                              onTap: (){},
                              value: getCurrentLanguageValue(EDIT),
                              child: Text14(text: getCurrentLanguageValue(EDIT) ?? "")
                          ),
                          PopupMenuItem(
                              onTap: (){},
                              value: getCurrentLanguageValue(DELETE),
                              child: Text14(text: getCurrentLanguageValue(DELETE) ?? "")
                          ),
                        ],
                      )
                ],
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: const BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.all(Radius.circular(8))
                ),
                child: SvgPicture.asset(team.svgLogo,width: 30, height: 30,),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 5,left: 20,right: 20),
                child: Text18(text: team.name,textColor: white,textAlign: TextAlign.center,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
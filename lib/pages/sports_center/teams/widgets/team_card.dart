import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/models/team_entity.dart';
import 'package:football_next_gen/widgets/texts.dart';
import '../../../../constants/colors.dart';

class TeamCard extends StatelessWidget{

  final TeamEntity team;
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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                        Icons.more_vert,
                        color: white
                    )
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
                  padding: const EdgeInsets.only(top: 5),
                  child: Text18(text: team.name,textColor: white,),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
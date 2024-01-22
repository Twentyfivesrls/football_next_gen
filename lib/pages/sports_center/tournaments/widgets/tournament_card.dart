import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/widgets/texts.dart';
import '../../../../constants/colors.dart';
import '../../../../models/tournament.dart';

class TournamentCard extends StatelessWidget{

  final TournamentEntity tournament;
  final Function() goToDetail;

  const TournamentCard({super.key, required this.tournament, required this.goToDetail});

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

                SvgPicture.asset(ImagesConstants.eventsImg,width: 30, height: 30,),

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text20(text: tournament.name,textColor: white,),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
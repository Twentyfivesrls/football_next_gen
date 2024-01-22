import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/widgets/texts.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/images_constants.dart';
import '../../../../models/group_entity.dart';

class GroupCard extends StatelessWidget{

  final GroupEntity group;
  final String name;
  final Function() goToDetail;

  const GroupCard({super.key, required this.group, required this.goToDetail, required this.name});

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

                SvgPicture.asset(ImagesConstants.groupsImg,width: 30, height: 30,),


                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text20(text: name,textColor: white,),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
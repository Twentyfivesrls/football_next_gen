import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/widgets/texts.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/images_constants.dart';
import '../../../../constants/language.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: PopupMenuButton(
                    padding: const EdgeInsets.only(right: 10),
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
              ),

              SvgPicture.asset(ImagesConstants.groupsImg,width: 30, height: 30,),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text18(text: name,textColor: white,),
              )

            ],
          ),
        ),
      ),

    );
  }
}
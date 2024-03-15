import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/texts.dart';

class ProfileHeader extends StatelessWidget{

  final String profileName;
  final String profileDesc;
  final String imageProfile;
  final String post;
  final String follower;
  final String followed;
  final String archive;
  final bool isChildProfile;
  final Function() editProfile;
  final Function() goToFollowers;

  const ProfileHeader({
    super.key,
    required this.profileName,
    required this.imageProfile,
    required this.profileDesc,
    required this.editProfile,
    this.followed = "",
    this.archive = "",
    required this.follower,
    required this.post,
    required this.goToFollowers,
    this.isChildProfile = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //CHILD
          Visibility(
            visible: isChildProfile,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  imageProfile,
                  height: 120,
                  width: 120,
                ),

                GestureDetector(
                  onTap: goToFollowers,
                  child: Column(
                    children: [
                      const Text14(text: "Follower"),
                      Text14(text: follower,fontWeight: FontWeight.w600,),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: goToFollowers,
                  child: Column(
                    children: [
                      const Text14(text: "Seguiti"),
                      Text14(text: followed,fontWeight: FontWeight.w600),
                    ],
                  ),
                ),

                Column(
                  children: [
                    const Text14(text: "Post"),
                    Text14(text: post,fontWeight: FontWeight.w600),
                  ],
                )
              ],
            ),
          ),

          //SPORTS CENTER
          Visibility(
            visible: !isChildProfile,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  imageProfile,
                  height: 120,
                  width: 120,
                ),

                GestureDetector(
                  onTap: goToFollowers,
                  child: Column(
                    children: [
                      const Text14(text: "Follower"),
                      Text14(text: follower,fontWeight: FontWeight.w600,),
                    ],
                  ),
                ),
                Column(
                    children: [
                      const Text14(text: "Post"),
                      Text14(text: post,fontWeight: FontWeight.w600),
                    ],
                ),

                Column(
                  children: [
                    const Text14(text: "Archivio"),
                    Text14(text: archive,fontWeight: FontWeight.w600),
                  ],
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextH1(text: profileName),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text14(text: profileDesc),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: ActionButton(
                onPressed: editProfile,
                backgroundColor: secondary,
                textColor: primary,
                borderColor: secondary,
                text: getCurrentLanguageValue(EDIT_PROFILE) ?? "",
            ),
          )
        ],
      ),
    );
  }
}
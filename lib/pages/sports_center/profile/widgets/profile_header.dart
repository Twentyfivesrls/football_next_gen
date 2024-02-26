import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/texts.dart';
import '../../../../constants/images_constants.dart';

class ProfileHeader extends StatelessWidget{

  final String profileName;
  final String profileDesc;
  final String imageProfile;
  final Function() editProfile;

  const ProfileHeader({
    super.key,
    required this.profileName,
    required this.imageProfile,
    required this.profileDesc,
    required this.editProfile
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            imageProfile,
            height: 120,
            width: 120,
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
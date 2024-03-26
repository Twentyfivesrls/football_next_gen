import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/inputs.dart';
import 'package:football_next_gen/widgets/texts.dart';

class EditProfileHeader extends StatelessWidget{
  final String profileName;
  final String profileDesc;
  final String imageProfile;
  final String post;
  final String follower;
  final String followed;
  final Function() goToFollowers;
  TextEditingController descriptionController;

   EditProfileHeader({
    super.key,
    required this.profileName,
    required this.imageProfile,
    required this.profileDesc,
    this.followed = "",
    required this.follower,
    required this.post,
    required this.goToFollowers,
    required this.descriptionController
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextH1(text: profileName),
          ),

          InputWidget(
              controller: descriptionController,
              hintText: getCurrentLanguageValue(BIO) ?? "",
              labelText:  getCurrentLanguageValue(BIO) ?? "",
              minLines: 4,
              maxLines: 999,

          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: DividerWidget(),
          )


        ],
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/models/profile_entity.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/texts.dart';

class SingleFollower extends StatelessWidget{

  final ProfileEntityDtoForList profile;
  final Function() onPressed;
  final Function() goToProfile;
  final String buttonText;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;


  const SingleFollower({super.key, required this.profile, required this.onPressed, required this.buttonText, required this.borderColor, required this.backgroundColor, required this.textColor, required this.goToProfile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: goToProfile,
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SvgPicture.asset(
                            profile.image,
                            height: 40,
                            width: 40
                        ),
                      ),
                      Text14(
                        text: profile.name,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),

                  ActionButton(
                      onPressed: onPressed,
                      text: buttonText,
                      width: 106,
                      height: 40,
                      backgroundColor: backgroundColor,
                      textColor: textColor,
                      borderColor: borderColor,
                  )
                ],
              ),
            ),
          ),
        ),
        const DividerWidget(),
      ],
    );
  }

}
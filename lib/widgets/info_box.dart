import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/widgets/texts.dart';

import '../constants/colors.dart';

class InfoBoxWidget extends StatelessWidget{
  final String text;
  final String labelText;
  final bool showBottomText;
  final String svgIcon;
  final Color textColor;

  const InfoBoxWidget({
    super.key,
    this.text = '',
    required this.svgIcon,
    required this.labelText,
    this.showBottomText = true,
    this.textColor = textProfileGrey
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(svgIcon),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text16(
                text: labelText,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        Visibility(
          visible: showBottomText,
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text16(text: text,textColor: textColor,),
          ),
        )
      ],
    );
  }

}
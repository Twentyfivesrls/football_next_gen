import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/widgets/texts.dart';

import '../constants/colors.dart';

class InfoBoxWidget extends StatelessWidget{
  final String text;
  final String labelText;
  final bool showBottomText;
  final bool showIcon;
  final String svgIcon;
  final Color textColor;

  const InfoBoxWidget({
    super.key,
    this.text = '',
    this.svgIcon = '',
    required this.labelText,
    this.showBottomText = true,
    this.textColor = textProfileGrey,
    this.showIcon = true
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Visibility(
              visible: showIcon,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SvgPicture.asset(svgIcon),
                )
            ),
            Text14(
                text: labelText,
                fontWeight: FontWeight.w600,
            )
          ],
        ),
        Visibility(
          visible: showBottomText,
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text14(text: text,textColor: textColor,),
          ),
        )
      ],
    );
  }

}
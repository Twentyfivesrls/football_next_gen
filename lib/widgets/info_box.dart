import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/widgets/texts.dart';

import '../constants/colors.dart';

class InfoBoxWidget extends StatelessWidget{
  final String text;
  final String labelText;
  final bool showBottomText;
  final bool showIcon;
  final bool underline;
  final String svgIcon;
  final Color textColor;
  final CrossAxisAlignment crossAxisAlignment;

  const InfoBoxWidget({
    super.key,
    this.text = '',
    this.svgIcon = '',
    required this.labelText,
    this.showBottomText = true,
    this.textColor = textProfileGrey,
    this.showIcon = true,
    this.underline = false,
    this.crossAxisAlignment = CrossAxisAlignment.start
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
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
                underline: underline,
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
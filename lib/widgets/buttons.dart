import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/widgets/texts.dart';


class ActionButton extends StatelessWidget{

  final Function() onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double borderRadius; //8
  final double height; //60
  final FontWeight fontWeight;
  final String? svgPrefixIcon;
  final bool showPrefixIcon;
  final String? svgSuffixIcon;
  final bool showSuffixIcon;
  final bool rowLayout;
  final MainAxisAlignment mainAxisAlignment;

  const ActionButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = primary,
    this.textColor = white,
    this.borderRadius = 8,
    this.borderColor = primary,
    this.fontWeight = FontWeight.w600,
    this.height = 60,
    this.svgPrefixIcon,
    this.showPrefixIcon = false,
    this.rowLayout = true,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.svgSuffixIcon,
    this.showSuffixIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: height,
      child: FilledButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              backgroundColor: MaterialStateColor.resolveWith((states) => backgroundColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    side: BorderSide(
                        color: borderColor
                    ),
                    borderRadius: BorderRadius.circular(borderRadius),
                  )
              )
          ),
          onPressed: onPressed,
          child: rowLayout ? Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Visibility(
                    visible: showPrefixIcon,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(svgPrefixIcon ?? ""),
                    ),
                  ),
                  Text14(
                    text: text,
                    fontWeight: fontWeight,
                    textColor: textColor,
                  ),
                ],
              ),


              Visibility(
                visible: showSuffixIcon,
                child: SvgPicture.asset(svgSuffixIcon ?? ""),
              ),
            ],
          ) : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: showPrefixIcon,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SvgPicture.asset(svgPrefixIcon ?? ""),
                ),
              ),
              Text14(
                text: text,
                fontWeight: fontWeight,
                textColor: textColor,
              ),
            ],
          )
      ),
    );
  }

}


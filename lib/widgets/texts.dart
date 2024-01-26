import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';

class TextH1 extends StatelessWidget {
  final String text;
  final Color textColor;
  final bool? underline;
  final FontWeight fontWeight;
  final TextAlign textAlign;


  const TextH1({super.key,
    required this.text,
    this.textColor = black25,
    this.underline,
    this.fontWeight = FontWeight.w600,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: 22,
          color: textColor,
          fontWeight: fontWeight,
          decoration: (underline != null && underline!)
              ? TextDecoration.underline
              : null,
        )
    );
  }
}

class Text18 extends StatelessWidget {
  final String text;
  final Color textColor;
  final bool? underline;
  final FontWeight fontWeight;
  final TextAlign textAlign;


  const Text18({super.key,
    required this.text,
    this.textColor = black25,
    this.underline,
    this.fontWeight = FontWeight.w600,
    this.textAlign = TextAlign.start
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: 18,
          color: textColor,
          fontWeight: fontWeight,
          decoration: (underline != null && underline!)
              ? TextDecoration.underline
              : null,
        )
    );
  }
}

class Text14 extends StatelessWidget {
  final String text;
  final Color textColor;
  final bool? underline;
  final FontWeight fontWeight;
  final TextAlign textAlign;


  const Text14({super.key,
    required this.text,
    this.textColor = black25,
    this.underline,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.start
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: 14,
          color: textColor,
          fontWeight: fontWeight,
          decoration: (underline != null && underline!)
              ? TextDecoration.underline
              : null,
        )
    );
  }
}

class Text10 extends StatelessWidget {
  final String text;
  final Color textColor;
  final bool? underline;
  final FontWeight fontWeight;
  final TextAlign textAlign;


  const Text10({super.key,
    required this.text,
    this.textColor = black25,
    this.underline,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.start
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: 10,
          color: textColor,
          fontWeight: fontWeight,
          decoration: (underline != null && underline!)
              ? TextDecoration.underline
              : null,
        )
    );
  }
}






class NavigationText extends StatelessWidget {
  final String text;
  final Color textColor;
  final TextDecoration underline;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final Function() onTap;
  final double fontSize;

  const NavigationText({super.key,
    required this.text,
    this.textColor = navigationText,
    this.underline = TextDecoration.underline,
    this.fontWeight = FontWeight.w600,
    this.textAlign = TextAlign.start,
    this.fontSize = 14,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontWeight: fontWeight,
            decoration: underline
          )
      ),
    );
  }
}

class InputText extends StatelessWidget {
  final String text;
  final Color textColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double paddingTop;
  final double paddingBottom;
  final double paddingRight;
  final double paddingLeft;

  const InputText({super.key,
    required this.text,
    required this.textColor,
    this.fontWeight = FontWeight.w600,
    this.textAlign = TextAlign.start,
    this.paddingTop = 0,
    this.paddingBottom = 10,
    this.paddingLeft = 0,
    this.paddingRight = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop,
        bottom: paddingBottom,
        left: paddingLeft,
        right: paddingRight,
      ),
      child: Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: 14,
            color: textColor,
            fontWeight: fontWeight,
          )
      ),
    );
  }
}


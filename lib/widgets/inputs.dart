
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/widgets/texts.dart';

class InputWidget extends StatelessWidget{

  final double verticalPadding; //0
  final double horizontalPadding; //0
  final double horizontalContentPadding; //12
  final double verticalContentPadding; //15
  final double fontSize; //16
  final double hintSize; //16
  final double borderRadius; //4
  final Color textColor;
  Color? hintColor = opaqueBlack25;
  final String hintText;
  final FontWeight hintWeight;
  TextInputAction textInputAction;
  TextEditingController controller;
  final bool obscureText;
  final bool enabled;
  final bool showLabel;
  final TextInputType keyboard;
  final iconOnTap;
  final bool showSuffixIcon;
  final IconData? suffixIcon;
  final String labelText;
  final FontWeight labelFontWeight;
  final TextAlign labelAlign;
  final Color labelColor;
  final double labelPaddingBottom;
  final double labelPaddingTop;
  final double labelPaddingRight;
  final double labelPaddingLeft;
  final int minLines;
  final int maxLines;

  InputWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.verticalPadding = 0,
    this.horizontalPadding = 0,
    this.fontSize = 16,
    this.hintSize = 16,
    this.textInputAction = TextInputAction.next,
    this.keyboard = TextInputType.text,
    this.obscureText = false,
    this.enabled = true,
    this.textColor = black25,
    this.hintColor,
    this.borderRadius = 4,
    this.labelText = '',
    this.labelColor = black25,
    this.showLabel = true,
    this.hintWeight = FontWeight.w500,
    this.labelPaddingBottom = 10,
    this.labelPaddingLeft = 0,
    this.labelPaddingRight = 0,
    this.labelPaddingTop = 0,
    this.labelAlign = TextAlign.start,
    this.labelFontWeight = FontWeight.w600,
    this.iconOnTap,
    this.showSuffixIcon = false,
    this.suffixIcon,
    this.horizontalContentPadding = 12,
    this.verticalContentPadding = 15,
    this.minLines = 1,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: showLabel,
          child: InputText(
            text: labelText,
            paddingBottom: labelPaddingBottom,
            paddingLeft: labelPaddingLeft,
            paddingRight: labelPaddingRight,
            paddingTop: labelPaddingTop,
            textColor: labelColor,
            fontWeight: labelFontWeight,
            textAlign: labelAlign,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding
          ),
          child: TextFormField(
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
            ),
            maxLines: maxLines,
            minLines: minLines,
            obscureText: obscureText,
            enabled: enabled,
            textInputAction: textInputAction,
            controller: controller,
            onEditingComplete: () => node.nextFocus(),
            decoration: InputDecoration(
              fillColor: white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                      color: opaqueBlack25
                  )
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                      color: opaqueBlack25
                  )
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: verticalContentPadding,horizontal: horizontalContentPadding),
              hintText: hintText,
              hintStyle: TextStyle(
                  color: hintColor,
                  fontSize: hintSize,
                  fontWeight: hintWeight
              ),
              suffixIcon: showSuffixIcon ? Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                  child: GestureDetector(
                    onTap: iconOnTap,
                    child: Icon(
                        suffixIcon,
                        color: opaqueBlack25
                    )
                ),
              ) : null,
            ),

          ),
        ),
      ],
    );
  }
}


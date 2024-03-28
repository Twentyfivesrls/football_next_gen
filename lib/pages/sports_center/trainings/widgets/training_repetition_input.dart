import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';

class TrainingRepetitionInput extends StatelessWidget {
  TextEditingController controller;
  final bool enabled;
  final String hintText;
  final Function()? onTap;
  final iconOnTap;
  final bool showSuffixIcon;
  final IconData? suffixIcon;
  final Color? iconColor;
  final TextInputType keyboardType;

  TrainingRepetitionInput(
      {super.key,
      required this.controller,
      this.enabled = true,
      required this.hintText,
      this.onTap,
      this.iconOnTap,
      this.showSuffixIcon = false,
      this.suffixIcon,
      this.iconColor,
      this.keyboardType = TextInputType.text
      });

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return TextFormField(
      enabled: enabled,
      controller: controller,
      textInputAction: TextInputAction.next,
      onEditingComplete: () => node.nextFocus(),
      onTap: onTap,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        fillColor: enabled ? white : secondary,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: opaqueBlack25)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: opaqueBlack25)),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: opaqueBlack25),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        suffixIcon: showSuffixIcon
            ? Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: GestureDetector(
                    onTap: iconOnTap,
                    child: Icon(suffixIcon, color: iconColor)),
              )
            : null,
      ),
    );
  }
}

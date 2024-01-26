import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/widgets/texts.dart';

class RadioButtonWidget extends StatelessWidget {
  final String title;
  final Function onChanged;
  final groupValue;
  final value;

  const RadioButtonWidget({
    super.key,
    required this.title,
    required this.onChanged,
    required this.groupValue,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      contentPadding: EdgeInsets.zero,
      title: Text14(text: title),
      leading: Radio(
        activeColor: primary,
        overlayColor: MaterialStateProperty.all(white),
          visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity
          ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        value: value,
        groupValue: groupValue,
        onChanged: (newValue){onChanged(newValue);},
      ),
    );
  }
}

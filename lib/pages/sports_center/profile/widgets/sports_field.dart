import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/models/sport_field.dart';
import 'package:football_next_gen/widgets/texts.dart';
import '../../../../constants/language.dart';
import '../../../../widgets/divider.dart';
import '../../../../widgets/info_box.dart';

class SportsField extends StatelessWidget{

  final Function() editSports;
  final List<SportFieldEntity> fields;

  const SportsField({
    super.key,
    required this.editSports,
    required this.fields,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,left:20, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text18(
            text: getCurrentLanguageValue(FIELDS) ?? "",
            textColor: primary,
          ),

          Column(
            children: fields.map((e) => field(e)).toList(),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: DividerWidget(),
          )
        ],
      ),
    );
  }


  Widget field(SportFieldEntity field){
    return Padding(
        padding: const EdgeInsets.only(top: 30),
        child: InfoBoxWidget(labelText: field.name, svgIcon: field.svgIcon, text: 'N° ${field.fieldsNumber}',)
    );
  }
}
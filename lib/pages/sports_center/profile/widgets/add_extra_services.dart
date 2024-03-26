import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/models/extra_service.dart';
import 'package:football_next_gen/models/sport.dart';
import 'package:football_next_gen/models/sport_field.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/single_sport_selection.dart';
import 'package:football_next_gen/widgets/autocomplete.dart';
import 'package:football_next_gen/widgets/texts.dart';

class AddExtraServices extends StatelessWidget{

  final List<String> kOptions;
  final List<ExtraServiceEntity> extraServices;
  final Function() removeExtraService;

  const AddExtraServices({super.key, required this.kOptions, required this.extraServices,required this.removeExtraService,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text18(
          text: getCurrentLanguageValue(EXTRA_SERVICES) ?? "",
          textColor: primary,
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: AutocompleteWidget(
            kOptions: kOptions,
            hintText: 'Seleziona un servizio extra da aggiungere',
            labelText: "Sports",
          ),
        ),
        ...extraServices.map((e) => SingleSelection(
            name: e.name,
            labelText: "Servizio extra ${extraServices.indexOf(e) + 1}",
            remove: removeExtraService
        )),

      ],
    );
  }
}
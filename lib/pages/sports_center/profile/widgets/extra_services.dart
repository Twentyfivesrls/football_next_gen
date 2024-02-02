import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/widgets/texts.dart';
import '../../../../constants/language.dart';
import '../../../../models/extra_service.dart';
import '../../../../widgets/divider.dart';
import '../../../../widgets/info_box.dart';

class ExtraServices extends StatelessWidget{

  final Function() editSports;
  final List<ExtraServiceEntity> services;

  const ExtraServices({
    super.key,
    required this.editSports,
    required this.services,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,left:20, top: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text18(
                text: getCurrentLanguageValue(EXTRA_SERVICES) ?? "",
                textColor: primary,
              ),

              GestureDetector(
                onTap: editSports,
                child: SvgPicture.asset(ImagesConstants.editImg),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              children: services.map((e) => service(e)).toList(),
            ),
          ),

        /*  const Padding(
            padding: EdgeInsets.only(top: 30),
            child: DividerWidget(),
          )*/
        ],
      ),
    );
  }


  Widget service(ExtraServiceEntity service){
    return Padding(
        padding: const EdgeInsets.only(top: 30),
        child: InfoBoxWidget(labelText: service.name, svgIcon: service.svgIcon, showBottomText: false)
    );
  }
}
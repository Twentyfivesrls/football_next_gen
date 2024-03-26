import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/info_box.dart';
import 'package:football_next_gen/widgets/texts.dart';
import '../../../../constants/language.dart';

class ProfileContacts extends StatelessWidget{

  final Function() editContacts;
  final String address;
  final String phone;
  final String email;
  final double paddingRight;
  final double paddingLeft;
  final double paddingTop;

  const ProfileContacts({
    super.key,
    required this.editContacts,
    required this.address,
    required this.phone,
    required this.email,
    this.paddingLeft = 20,
    this.paddingRight = 20,
    this.paddingTop = 30
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: paddingRight,left: paddingLeft, top: paddingTop),
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Text18(
            text: getCurrentLanguageValue(CONTACTS) ?? "",
            textColor: primary,
          ),


          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InfoBoxWidget(
              text: address,
              svgIcon: ImagesConstants.locationImg,
              labelText: getCurrentLanguageValue(ADDRESS) ?? "",
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InfoBoxWidget(
              text: phone,
              svgIcon: ImagesConstants.phoneImg,
              labelText: getCurrentLanguageValue(NUMBER) ?? "",
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InfoBoxWidget(
              text: email,
              svgIcon: ImagesConstants.emailImg,
              labelText: getCurrentLanguageValue(EMAIL) ?? "",
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: DividerWidget(),
          )
        ],
      ),
    );
  }
}
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

  const ProfileContacts({
    super.key,
    required this.editContacts,
    required this.address,
    required this.phone,
    required this.email
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,left: 20, top: 30),
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
            padding: EdgeInsets.only(top: 30),
            child: DividerWidget(),
          )
        ],
      ),
    );
  }
}
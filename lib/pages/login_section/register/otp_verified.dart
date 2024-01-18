import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/app_pages.dart';
import '../../../constants/language.dart';
import '../../../widgets/texts.dart';

class OtpVerified extends StatelessWidget{
  const OtpVerified({super.key});
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child:messageSection(),
          ),
          Expanded(
            flex: 1,
            child:backToLoginSection(context),
          ),
        ],
      ),
    );
  }


  Widget messageSection(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          ImagesConstants.checkCircleImg,
          width: 100,
          height: 100,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: TextH1(
            text: getCurrentLanguageValue(CONFIRMATION_OCCURRED) ?? "",
          ),
        ),

        Text16(
          text: getCurrentLanguageValue(CONFIRMATION_OCCURRED_SUBTITLE) ?? "",
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget backToLoginSection(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Text16(
            text: getCurrentLanguageValue(BACK_TO_LOGIN) ?? "",
          ),
        ),
        NavigationText(
          text: getCurrentLanguageValue(LOGIN) ?? "",
          onTap: (){
            GoRouter.of(context).go(AppPage.login.path);
          },
        ),
      ],
    );
  }
}
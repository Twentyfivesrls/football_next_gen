import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import '../../../widgets/texts.dart';
import '../models/confirm_page_data.dart';

class ConfirmPage extends StatelessWidget{

  final ConfirmPageData data;


  const ConfirmPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      goBack: (){},
      goHome: (){},
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child:messageSection(),
          ),
          Expanded(
            flex: 1,
            child:backSection(context),
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
            text: data.titleText,
            textAlign: TextAlign.center,
          ),
        ),
        Visibility(
          visible: data.showSubtitle,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text16(
                text: data.subtitleText ?? "",
                textAlign: TextAlign.center,
              )
          ),
        )
      ],
    );
  }

  Widget backSection(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Text16(
            text: data.bottomText,
          ),
        ),
        NavigationText(
          text: data.navigationText ?? "",
          onTap: (){
            data.onTap;
          },
        ),
      ],
    );
  }


}
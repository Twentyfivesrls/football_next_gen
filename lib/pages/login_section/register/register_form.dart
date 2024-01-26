import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/app_pages.dart';

class RegisterForm extends StatefulWidget{
  const RegisterForm({super.key});

  @override
  State<StatefulWidget> createState() => RegisterFormState();
}


class RegisterFormState extends State<RegisterForm>{
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Expanded(
          flex: 1,
          child: titleSection(),
        ),
        Expanded(
          flex: 1,
          child:subtitleSection(),
        ),
        Expanded(
          flex: 3,
          child:cardSection(),
        ),
        Expanded(
          flex: 1,
          child:backToLoginSection(),
        )

      ],

    );
  }

  Widget titleSection(){
    return Column(
      children: [
        TextH1(
          text: getCurrentLanguageValue(ENTER_IN) ?? "",
          textAlign: TextAlign.center,
        ),
        TextH1(
          text: getCurrentLanguageValue(FOOTBALL_NEXT_GEN) ?? "",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget subtitleSection(){
    return Text14(
      text: getCurrentLanguageValue(REGISTER_SUBTITLE) ?? "",
      textAlign: TextAlign.center,
    );
  }


  Widget cardSection(){
    return Column(
      children: [
        ActionButton(
          onPressed: (){
            context.push(AppPage.sportsCenterRegister.path);
          },
          text: getCurrentLanguageValue(SPORTS_CENTER) ?? "",
          rowLayout: false,
          showPrefixIcon: true,
          svgPrefixIcon: ImagesConstants.sportsCenterImg,
          height: 134,
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ActionButton(
            onPressed: (){
              context.push(AppPage.parentRegister.path);
            },
            text: getCurrentLanguageValue(PARENT) ?? "",
            rowLayout: false,
            showPrefixIcon: true,
            svgPrefixIcon: ImagesConstants.parentImg,
            height: 134,
          ),
        )
      ],
    );
  }

  Widget backToLoginSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Text14(
            text: getCurrentLanguageValue(ALREDY_HAVE_ACCOUNT) ?? "",
          ),
        ),
        NavigationText(
          text: getCurrentLanguageValue(ACCEDI) ?? "",
          onTap: (){
            context.go(AppPage.login.path);
          },
        ),
      ],
    );
  }


}
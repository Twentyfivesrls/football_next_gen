import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/dialog.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';

class Settings extends StatefulWidget{
  const Settings({super.key});
  @override
  State<StatefulWidget> createState() => SettingsState();
}

class SettingsState extends State<Settings>{
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      paddingTop: 30,
      title: AppPage.settings.toTitle,
      appBar: 3,
        showTrailingIcon: false,
        goHome: (){},
        goBack: (){
          context.go(AppPage.homeSportsCenter.path);
        },
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buttonSection()
            ],
          )
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text18(
              text: getCurrentLanguageValue(GENERAL) ?? "",
            textColor: primary,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ActionButton(
                showPrefixIcon: true,
                svgPrefixIcon: ImagesConstants.lockImg,
                onPressed: (){
                  context.push(AppPage.resetPassword.path);
                },
                text:  getCurrentLanguageValue(RESET_PASSWORD) ?? "",
                backgroundColor: white,
                textColor: black25,
                borderColor: white,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                showSuffixIcon: true,
                svgSuffixIcon: ImagesConstants.chevronRightImg,
            ),
          ),
        ],
      ),
    );
  }


  Widget buttonSection() {
    return ActionButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context){
              return DialogWidget(
                  title: getCurrentLanguageValue(LOGOUT) ?? "",
                  message: 'Desideri veramente effettuare il logout?',
                  confirmText: 'Si, effettua il logout',
                  cancelText: 'No, resta connesso',
                  onConfirm: () {
                    context.go(AppPage.login.path);
                  },
              );
            });
        },
      text: getCurrentLanguageValue(LOGOUT) ?? "",
      backgroundColor: secondary,
      borderColor: secondary,
      textColor: black25,
    );
  }
}
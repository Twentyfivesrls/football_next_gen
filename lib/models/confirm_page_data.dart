import 'package:flutter/cupertino.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:go_router/go_router.dart';
import '../constants/language.dart';

class ConfirmPageData{
  final String titleText;
  final String? subtitleText;
  final String? navigationText;
  final String bottomText;
  final bool showSubtitle;
  final Function() onTap;

  ConfirmPageData({
  required this.titleText,
    this.subtitleText,
    required this.navigationText,
    required this.bottomText,
    this.showSubtitle = false,
    required this.onTap,
  });

  factory ConfirmPageData.addTeamConfirmed(BuildContext context) =>
      ConfirmPageData(
          titleText: getCurrentLanguageValue(TEAM_CREATED) ?? "",
          navigationText: getCurrentLanguageValue(TEAM_DETAIL) ?? "",
          bottomText: getCurrentLanguageValue(GO_TO_PAGE) ?? "",
          onTap: (){
            context.go(AppPage.teamDetail.path);
            },
      );


  factory ConfirmPageData.addGroupConfirmed(BuildContext context) =>
      ConfirmPageData(
        titleText: getCurrentLanguageValue(GROUP_CREATED) ?? "",
        navigationText: getCurrentLanguageValue(GROUP_DETAIL) ?? "",
        bottomText: getCurrentLanguageValue(GO_TO_PAGE) ?? "",
        onTap: (){
          context.push(AppPage.groupDetail.path);
        },
      );


  factory ConfirmPageData.addTrainingConfirmed(BuildContext context) =>
      ConfirmPageData(
        titleText: getCurrentLanguageValue(TRAINING_CREATED) ?? "",
        navigationText: getCurrentLanguageValue(TRAINING_DETAIL) ?? "",
        bottomText: getCurrentLanguageValue(GO_TO_PAGE) ?? "",
        onTap: (){
          context.push(AppPage.trainingDetail.path);
        },
      );

  factory ConfirmPageData.resetPasswordConfirmed(BuildContext context) =>
      ConfirmPageData(
        titleText: getCurrentLanguageValue(RESET_PASSWORD_CONFIRMED) ?? "",
        navigationText: AppPage.settings.toTitle,
        bottomText: getCurrentLanguageValue(GO_BACK_TO) ?? "",
        onTap: (){
          context.go(AppPage.settings.path);
        },
      );

  factory ConfirmPageData.addTournamentConfirmed(BuildContext context) =>
      ConfirmPageData(
        titleText: getCurrentLanguageValue(TOURNAMENT_CREATED) ?? "",
        navigationText: getCurrentLanguageValue(TOURNAMENT_DETAIL) ?? "",
        bottomText: getCurrentLanguageValue(GO_TO_PAGE) ?? "",
        onTap: (){
          context.go(AppPage.tournamentDetail.path);
        },
      );

  factory ConfirmPageData.recoverPassConfirmed(BuildContext context) =>
      ConfirmPageData(
          titleText: getCurrentLanguageValue(EMAIL_SENDED) ?? "",
          navigationText: getCurrentLanguageValue(LOGIN) ?? "",
          bottomText: getCurrentLanguageValue(BACK_TO_LOGIN) ?? "",
          onTap: (){
            context.go(AppPage.login.path);
            },
        showSubtitle: true,
        subtitleText: getCurrentLanguageValue(RECOVER_PASSWORD_CONFIRMED_SUBTITLE) ?? "",
      );


  factory ConfirmPageData.otpConfirmed(BuildContext context) =>
      ConfirmPageData(
          titleText: getCurrentLanguageValue(CONFIRMATION_OCCURRED) ?? "",
          navigationText: getCurrentLanguageValue(LOGIN) ?? "",
          bottomText: getCurrentLanguageValue(BACK_TO_LOGIN) ?? "",
          onTap: (){
            context.go(AppPage.login.path);
            },
        showSubtitle: true,
        subtitleText: getCurrentLanguageValue(CONFIRMATION_OCCURRED_SUBTITLE) ?? "",
      );
}
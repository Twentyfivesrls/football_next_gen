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

  factory ConfirmPageData.addTeamConfirmed(BuildContext context, bool isHome, bool edit) =>
      ConfirmPageData(
          titleText: edit ? "Squadra modificata con successo!" : getCurrentLanguageValue(TEAM_CREATED) ?? "",
          navigationText: getCurrentLanguageValue(TEAM_DETAIL) ?? "",
          bottomText: getCurrentLanguageValue(GO_TO_PAGE) ?? "",
          onTap: (){
            context.go(AppPage.teamDetail.path, extra: isHome);
            },
      );


  factory ConfirmPageData.addGroupConfirmed(BuildContext context, int tournamentId, bool edit) =>
      ConfirmPageData(
        titleText: edit ? 'Girone modificato con successo!' : getCurrentLanguageValue(GROUP_CREATED) ?? "",
        navigationText: getCurrentLanguageValue(GROUP_DETAIL) ?? "",
        bottomText: getCurrentLanguageValue(GO_TO_PAGE) ?? "",
        onTap: (){
          context.push(AppPage.groupDetail.path, extra: tournamentId);
        },
      );


  factory ConfirmPageData.addTrainingConfirmed(BuildContext context, int id, bool edit) =>
      ConfirmPageData(
        titleText: edit ? "Allenamento modificato con successo!" : getCurrentLanguageValue(TRAINING_CREATED) ?? "",
        navigationText: getCurrentLanguageValue(TRAINING_DETAIL) ?? "",
        bottomText: getCurrentLanguageValue(GO_TO_PAGE) ?? "",
        onTap: (){
          context.push(AppPage.trainingDetail.path, extra: id);
        },
      );

  factory ConfirmPageData.resetPasswordConfirmed(BuildContext context) =>
      ConfirmPageData(
        titleText: getCurrentLanguageValue(RESET_PASSWORD_CONFIRMED) ?? "",
        navigationText: AppPage.settings.toTitle,
        bottomText: getCurrentLanguageValue(GO_BACK_TO) ?? "",
        onTap: (){
          context.push(AppPage.settings.path);
        },
      );

  factory ConfirmPageData.addTournamentConfirmed(BuildContext context, int id, bool edit) =>
      ConfirmPageData(
        titleText: edit ? 'Torneo modificato con successo!' : getCurrentLanguageValue(TOURNAMENT_CREATED) ?? "",
        navigationText: getCurrentLanguageValue(TOURNAMENT_DETAIL) ?? "",
        bottomText: getCurrentLanguageValue(GO_TO_PAGE) ?? "",
        onTap: (){
          context.go(AppPage.tournamentDetail.path, extra: id);
        },
      );

  factory ConfirmPageData.addPostConfirmed(BuildContext context, int id) =>
      ConfirmPageData(
        titleText: getCurrentLanguageValue(POST_CREATED) ?? "",
        navigationText: getCurrentLanguageValue(MEDIA) ?? "",
        bottomText: getCurrentLanguageValue(BACK_TO_SECTION) ?? "",
        onTap: (){
          context.push(AppPage.postDetail.path, extra: id);
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
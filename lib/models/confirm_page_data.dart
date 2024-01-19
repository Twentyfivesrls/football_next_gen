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

  factory ConfirmPageData.addTeamConfirmed(context) =>
      ConfirmPageData(
          titleText: getCurrentLanguageValue(TEAM_CREATED) ?? "",
          navigationText: getCurrentLanguageValue(TEAM_DETAIL) ?? "",
          bottomText: getCurrentLanguageValue(GO_TO_PAGE) ?? "",
          onTap: (){
            GoRouter.of(context).go(AppPage.teamDetail.path);
            },
      );

  factory ConfirmPageData.addTournamentConfirmed(context) =>
      ConfirmPageData(
        titleText: getCurrentLanguageValue(TOURNAMENT_CREATED) ?? "",
        navigationText: getCurrentLanguageValue(TOURNAMENT_DETAIL) ?? "",
        bottomText: getCurrentLanguageValue(GO_TO_PAGE) ?? "",
        onTap: (){
          GoRouter.of(context).go(AppPage.tournamentDetail.path);
        },
      );


  factory ConfirmPageData.recoverPassConfirmed(context) =>
      ConfirmPageData(
          titleText: getCurrentLanguageValue(EMAIL_SENDED) ?? "",
          navigationText: getCurrentLanguageValue(LOGIN) ?? "",
          bottomText: getCurrentLanguageValue(BACK_TO_LOGIN) ?? "",
          onTap: (){
            GoRouter.of(context).go(AppPage.teamDetail.path);
            },
        showSubtitle: true,
        subtitleText: getCurrentLanguageValue(RECOVER_PASSWORD_CONFIRMED_SUBTITLE) ?? "",
      );


  factory ConfirmPageData.otpConfirmed(context) =>
      ConfirmPageData(
          titleText: getCurrentLanguageValue(CONFIRMATION_OCCURRED) ?? "",
          navigationText: getCurrentLanguageValue(LOGIN) ?? "",
          bottomText: getCurrentLanguageValue(BACK_TO_LOGIN) ?? "",
          onTap: (){
            GoRouter.of(context).go(AppPage.teamDetail.path);
            },
        showSubtitle: true,
        subtitleText: getCurrentLanguageValue(CONFIRMATION_OCCURRED_SUBTITLE) ?? "",
      );
}
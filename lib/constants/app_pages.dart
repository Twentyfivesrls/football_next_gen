enum AppPage {
  login,
  register,
  recoverPassword,
  sportsCenterRegister,
  parentRegister,
  insertOtp,
  homeSportsCenter,
  sportsCenterProfile,
  teamsList,
  addTeam,
  teamDetail,
  tournamentsList,
  addTournament,
  tournamentDetail,
  confirmPage,
  addGroup,
  groupDetail,
  trainingsList,
  addTraining,
  trainingDetail,
  filters,
  settings,
  resetPassword
}

extension AppPageExtension on AppPage {
  String get path {
    switch (this) {
      case AppPage.login:
        return "/";
      case AppPage.register:
        return "/register";
      case AppPage.recoverPassword:
        return "/recover_password";
      case AppPage.sportsCenterRegister:
        return "/sports_center_register";
      case AppPage.parentRegister:
        return "/parent_register";
      case AppPage.insertOtp:
        return "/insert_otp";
      case AppPage.homeSportsCenter:
        return "/home_sports_center";
      case AppPage.sportsCenterProfile:
        return "/sports_center_profile";
      case AppPage.teamsList:
        return "/teams_list";
      case AppPage.addTeam:
        return "/add_team";
      case AppPage.teamDetail:
        return "/team_detail";
      case AppPage.tournamentsList:
        return "/tournaments_list";
      case AppPage.addTournament:
        return "/add_tournament";
      case AppPage.tournamentDetail:
        return "/tournament_detail";
      case AppPage.confirmPage:
        return "/confirm_page";
      case AppPage.groupDetail:
        return "/group_detail";
      case AppPage.addGroup:
        return "/add_group";
      case AppPage.trainingsList:
        return "/trainings_list";
      case AppPage.addTraining:
        return "/add_training";
      case AppPage.trainingDetail:
        return "/training_detail";
      case AppPage.filters:
        return "/filters";
      case AppPage.settings:
        return "/settings";
      case AppPage.resetPassword:
        return "/reset_password";
    }
  }

  String get toName {
    switch (this) {
      case AppPage.login:
        return "LoginPage";
      case AppPage.register:
        return "RegisterPage";
      case AppPage.recoverPassword:
        return "RecoverPasswordPage";
      case AppPage.sportsCenterRegister:
        return "SportsCenterRegisterPage";
      case AppPage.parentRegister:
        return "ParentRegisterPage";
      case AppPage.insertOtp:
        return "InsertOtpPage";
      case AppPage.homeSportsCenter:
        return "HomeSportsCenter";
      case AppPage.sportsCenterProfile:
        return "SportsCenterProfile";
      case AppPage.teamsList:
        return "TeamsList";
      case AppPage.addTeam:
        return "AddTeam";
      case AppPage.teamDetail:
        return "TeamDetail";
      case AppPage.tournamentsList:
        return "TournamentsList";
      case AppPage.addTournament:
        return "AddTournament";
      case AppPage.tournamentDetail:
        return "TournamentDetail";
      case AppPage.confirmPage:
        return "ConfirmPage";
      case AppPage.addGroup:
        return "AddGroup";
      case AppPage.groupDetail:
        return "GroupDetail";
      case AppPage.trainingsList:
        return "TrainingsList";
      case AppPage.addTraining:
        return "AddTraining";
      case AppPage.trainingDetail:
        return "Training Detail";
      case AppPage.filters:
        return "Filters";
      case AppPage.settings:
        return "Settings";
      case AppPage.resetPassword:
        return "Reset Password";

    }
  }

  String get toTitle {
    switch (this) {
      case AppPage.login:
        return "Login";
      case AppPage.register:
        return "Registrazione";
      case AppPage.recoverPassword:
        return "Password dimenticata";
      case AppPage.sportsCenterRegister:
        return "Registrazione";
      case AppPage.parentRegister:
        return "Registrazione";
      case AppPage.insertOtp:
        return "Conferma avvenuta";
      case AppPage.homeSportsCenter:
        return "Home";
      case AppPage.sportsCenterProfile:
        return "Profilo";
      case AppPage.teamsList:
        return "Squadre";
      case AppPage.addTeam:
        return "Nuova squadra";
      case AppPage.teamDetail:
        return "Conferma";
      case AppPage.tournamentsList:
        return "Tornei";
      case AppPage.addTournament:
        return "Nuovo torneo";
      case AppPage.tournamentDetail:
        return "Dettaglio torneo";
      case AppPage.confirmPage:
        return "Conferma";
      case AppPage.addGroup:
        return "Nuovo girone";
      case AppPage.groupDetail:
        return "Dettagli girone";
      case AppPage.trainingsList:
        return "Allenamenti";
      case AppPage.addTraining:
        return "Aggiungi allenamento";
      case AppPage.trainingDetail:
        return "Dettagli allenamento";
      case AppPage.filters:
        return "Filtri";
      case AppPage.settings:
        return "Impostazioni";
      case AppPage.resetPassword:
        return "Reset password";
    }
  }
}

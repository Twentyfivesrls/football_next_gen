enum AppPage {
  login,
  register,
  recoverPassword,
  recoverPasswordConfirmed,
  sportsCenterRegister,
  parentRegister,
  insertOtp,
  otpVerified,
  homeSportsCenter,
  sportsCenterProfile,
  teamsList,
  addTeam,
  addTeamConfirmed,
  teamDetail,
  tournamentsList,
  addTournament,
  tournamentDetail,
  confirmPage
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
      case AppPage.recoverPasswordConfirmed:
        return "/recover_password_confirmed";
      case AppPage.sportsCenterRegister:
        return "/sports_center_register";
      case AppPage.parentRegister:
        return "/parent_register";
      case AppPage.insertOtp:
        return "/insert_otp";
      case AppPage.otpVerified:
        return "/otp_verified";
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
      case AppPage.addTeamConfirmed:
        return "/add_team_confirmed";
      case AppPage.tournamentsList:
        return "/tournaments_list";
      case AppPage.addTournament:
        return "/add_tournament";
      case AppPage.tournamentDetail:
        return "/tournament_detail";
      case AppPage.confirmPage:
        return "/confirm_page";
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
      case AppPage.recoverPasswordConfirmed:
        return "RecoverPasswordConfirmedPage";
      case AppPage.sportsCenterRegister:
        return "SportsCenterRegisterPage";
      case AppPage.parentRegister:
        return "ParentRegisterPage";
      case AppPage.insertOtp:
        return "InsertOtpPage";
      case AppPage.otpVerified:
        return "OtpVerified";
      case AppPage.homeSportsCenter:
        return "HomeSportsCenter";
      case AppPage.sportsCenterProfile:
        return "SportsCenterProfile";
      case AppPage.teamsList:
        return "TeamsList";
      case AppPage.addTeam:
        return "AddTeam";
      case AppPage.addTeamConfirmed:
        return "AddTeamConfirmed";
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
      case AppPage.recoverPasswordConfirmed:
        return "Recupero Password Confermato";
      case AppPage.sportsCenterRegister:
        return "Registrazione";
      case AppPage.parentRegister:
        return "Registrazione";
      case AppPage.insertOtp:
        return "Inserisci OTP";
      case AppPage.otpVerified:
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
        return "Dettagli squadra";
      case AppPage.addTeamConfirmed:
        return "Conferma";
      case AppPage.tournamentsList:
        return "Tornei";
      case AppPage.addTournament:
        return "Nuovo torneo";
      case AppPage.tournamentDetail:
        return "Dettaglio torneo";
      case AppPage.confirmPage:
        return "Conferma";
    }
  }
}

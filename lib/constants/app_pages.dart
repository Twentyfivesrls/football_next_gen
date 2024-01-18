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
  sportsCenterProfile
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
    }
  }
}

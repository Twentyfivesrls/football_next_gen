enum AppPage {
  login,
  register,
  recoverPassword,
  recoverPasswordConfirmed,
  sportsCenterRegister,
  parentRegister
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
    }
  }

  String get toTitle {
    switch (this) {
      case AppPage.login:
        return "Login";
      case AppPage.register:
        return "Registrazione";
      case AppPage.recoverPassword:
        return "Recupera Password";
      case AppPage.recoverPasswordConfirmed:
        return "Recupero Password Confermato";
      case AppPage.sportsCenterRegister:
        return "Registrazione";
      case AppPage.parentRegister:
        return "Registrazione";
    }
  }
}

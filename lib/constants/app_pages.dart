enum AppPage {
  login,
  register,
  recoverPassword,
  recoverPasswordConfirmed,
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
    }
  }
}

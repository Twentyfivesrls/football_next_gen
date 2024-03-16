import 'package:flutter/material.dart';
import 'package:flutter_keycloak/flutter_keycloak.dart';
import 'package:football_next_gen/auth/auth_listener.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/models/authentication_entity.dart';
import 'package:football_next_gen/models/profile_entity.dart';
import 'package:football_next_gen/repository/auth/keycloack_repository.dart';
import 'package:football_next_gen/repository/profile/profile_service.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/inputs.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/app_pages.dart';


class LoginForm extends StatefulWidget{
  const LoginForm({super.key});
  @override
  State<StatefulWidget> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm>{

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          loginTitleSection(),
          inputSection(),
          forgotPasswordSection(),
          loginButtonSection(),
          registerSection(),
          loginWithGoogleOrSpidSection(),
        ],
      ),
    );
  }

  Widget loginTitleSection() {
    return TextH1(
      text: getCurrentLanguageValue(LOGIN) ?? "",
    );
  }

  Widget inputSection() {
    return Column(
      children: [
        InputWidget(
          controller: emailController,
          hintText: getCurrentLanguageValue(EMAIL) ?? "",
          labelText: getCurrentLanguageValue(EMAIL) ?? "",
        ),
        InputWidget(
          controller: passwordController,
          hintText: getCurrentLanguageValue(PASSWORD) ?? "",
          labelText: getCurrentLanguageValue(PASSWORD) ?? "",
          labelPaddingTop: 20,
          showSuffixIcon: true,
          suffixIcon: passwordVisible ? Icons.visibility : Icons.visibility_off,
          obscureText: !passwordVisible,
          iconOnTap: (){
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
        ),
      ],
    );
  }

  Widget forgotPasswordSection() {
    return NavigationText(
      text: getCurrentLanguageValue(FORGOT_PASSWORD) ?? "",
      onTap: (){
        context.push(AppPage.recoverPassword.path);
      },
    );
  }


  Map config = {
    "resource": "fng-app",
    "realm" : "Fiitball-Next-Gen",
    "credentials" : {"secret": "CSN0CpvsdyS3vkZ3mzFLdCUujdvJQo9a"},
    "auth-server-url" : "http://80.211.123.141:8080"
  };

  Widget loginButtonSection() {
    return Column(
      children: [
        ActionButton(
          onPressed: () {
            performLogin();
          },
          text: getCurrentLanguageValue(ACCEDI) ?? "",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ActionButton(
            onPressed: (){
              context.go(AppPage.homeChild.path);
            },
            text: "Bambino",
          ),
        ),
      ],
    );
  }

  Widget registerSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Text14(
            text: getCurrentLanguageValue(DONT_HAVE_ACCOUNT) ?? "",
          ),
        ),
        NavigationText(
          text: getCurrentLanguageValue(CREATE_ONE) ?? "",
          onTap: (){
            context.push(AppPage.register.path);
          },
        ),
      ],
    );
  }

  Widget loginWithGoogleOrSpidSection() {
    return Column(
      children: [
       /* Text14(
          text: getCurrentLanguageValue(OR) ?? "",
          textColor: cancelGrey,
          fontWeight: FontWeight.w500,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 20),
          child: ActionButton(
            onPressed: (){},
            text: getCurrentLanguageValue(LOGIN_WITH_GOOGLE) ?? "",
            height: 68,
            showPrefixIcon: true,
            svgPrefixIcon: ImagesConstants.googleImg,
            backgroundColor: white,
            textColor: primary,
          ),
        ),
        ActionButton(
          onPressed: (){},
          text: getCurrentLanguageValue(LOGIN_WITH_SPID) ?? "",
          height: 68,
          showPrefixIcon: true,
          svgPrefixIcon: ImagesConstants.spidImg,
          backgroundColor: lightBlue,
          borderColor: lightBlue,
        )*/
      ],
    );
  }



  void performLogin(){
    var email = emailController.text;
    var user = AuthenticationEntity(
      username: email,
      password: passwordController.text,
      clientId: "admin-cli",
      clientSecret: "yotXnLuS4DMVtIPBES0oabzzZdE1Qbzs",
      grantType: "password",
    );
    KeycloakRepository().login(user).then((value) {
      // verify value if is a Response or another type of object
      // i assume that is a DIO response, so it has .data
      var accessToken = value;
      ProfileService().fetchProfile(email).then((profileEntity) {
        print("HO RECUPERATO UTENTE");
        print(profileEntity.toJson());
        AuthListener().setAuthenticationData(profileEntity, accessToken);
        // context.go(AppPage.homeSportsCenter.path);
      });
    });
  }
}
import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/inputs.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/app_pages.dart';
import '../../../constants/colors.dart';
import '../../../constants/images_constants.dart';

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
        GoRouter.of(context).push(AppPage.recoverPassword.path);
      },
    );
  }

  Widget loginButtonSection() {
    return ActionButton(
      onPressed: (){},
      text: getCurrentLanguageValue(ACCEDI) ?? "",
    );
  }

  Widget registerSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Text16(
            text: getCurrentLanguageValue(DONT_HAVE_ACCOUNT) ?? "",
          ),
        ),
        NavigationText(
          text: getCurrentLanguageValue(CREATE_ONE) ?? "",
          onTap: (){
            GoRouter.of(context).push(AppPage.register.path);
          },
        ),
      ],
    );
  }

  Widget loginWithGoogleOrSpidSection() {
    return Column(
      children: [
        Text16(
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
        )
      ],
    );
  }
}
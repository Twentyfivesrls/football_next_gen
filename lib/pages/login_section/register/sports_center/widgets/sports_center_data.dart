import 'package:flutter/material.dart';
import 'package:football_next_gen/widgets/texts.dart';
import '../../../../../constants/language.dart';
import '../../../../../widgets/inputs.dart';

class SportCenterData extends StatelessWidget{

  final GlobalKey formKey;
  TextEditingController nameController;
  TextEditingController cityController;
  TextEditingController emailController;
  TextEditingController phoneController;
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;
  final confirmPasswordOnTap;
  final passwordOnTap;
  final bool obscureTextConfirmPass;
  final bool obscureTextPass;
  final IconData suffixIconPassword;
  final IconData suffixIconConfirmPassword;


  SportCenterData({
    super.key,
    required this.formKey,
    required this.confirmPasswordController,
    required this.passwordController,
    required this.phoneController,
    required this.nameController,
    required this.cityController,
    required this.emailController,
    this.confirmPasswordOnTap,
    this.passwordOnTap,
    required this.obscureTextConfirmPass,
    required this.obscureTextPass,
    required this.suffixIconPassword,
    required this.suffixIconConfirmPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            InputWidget(
              controller: nameController,
              hintText: getCurrentLanguageValue(SPORT_CENTER_NAME) ?? "",
              labelText: getCurrentLanguageValue(SPORT_CENTER_NAME) ?? "",
              labelPaddingTop: 20,
            ),

            InputWidget(
              controller: cityController,
              hintText: getCurrentLanguageValue(CITY) ?? "",
              labelText: getCurrentLanguageValue(CITY) ?? "",
              labelPaddingTop: 20,
            ),

            InputWidget(
              controller: phoneController,
              hintText: getCurrentLanguageValue(PHONENUMBER) ?? "",
              labelText: getCurrentLanguageValue(PHONENUMBER) ?? "",
              labelPaddingTop: 20,
            ),

            InputWidget(
              controller: emailController,
              hintText: getCurrentLanguageValue(EMAIL) ?? "",
              labelText: getCurrentLanguageValue(EMAIL) ?? "",
              labelPaddingTop: 20,
            ),

            InputWidget(
              controller: passwordController,
              hintText: getCurrentLanguageValue(PASSWORD) ?? "",
              labelText: getCurrentLanguageValue(PASSWORD) ?? "",
              labelPaddingTop: 20,
              obscureText: obscureTextPass,
              iconOnTap: passwordOnTap,
              showSuffixIcon: true,
              suffixIcon: suffixIconPassword,
            ),

            InputWidget(
              controller: confirmPasswordController,
              hintText: getCurrentLanguageValue(PASSWORD_CONFIRM) ?? "",
              labelText: getCurrentLanguageValue(PASSWORD_CONFIRM) ?? "",
              labelPaddingTop: 20,
              obscureText: obscureTextConfirmPass,
              iconOnTap: confirmPasswordOnTap,
              showSuffixIcon: true,
              suffixIcon: suffixIconConfirmPassword,
            ),
          ],
        ),
      ),
    );
  }
}
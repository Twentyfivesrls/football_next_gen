import 'package:flutter/material.dart';
import 'package:football_next_gen/widgets/texts.dart';
import '../../../../../constants/language.dart';
import '../../../../../widgets/inputs.dart';

class ChildDataForm extends StatelessWidget{

  final GlobalKey formKey;
  TextEditingController nameController;
  TextEditingController lastNameController;
  TextEditingController usernameController;
  TextEditingController dateController;
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;
  final confirmPasswordOnTap;
  final passwordOnTap;
  final bool obscureTextConfirmPass;
  final bool obscureTextPass;
  final IconData suffixIconPassword;
  final IconData suffixIconConfirmPassword;

  ChildDataForm({
    super.key,
    required this.formKey,
    required this.confirmPasswordController,
    required this.passwordController,
    required this.dateController,
    required this.nameController,
    required this.lastNameController,
    required this.usernameController,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text20(
            text: getCurrentLanguageValue(PARENT_DATA) ?? "",
          ),


          InputWidget(
            controller: nameController,
            hintText: getCurrentLanguageValue(FIRSTNAME) ?? "",
            labelText: getCurrentLanguageValue(FIRSTNAME) ?? "",
            labelPaddingTop: 20,
          ),

          InputWidget(
            controller: lastNameController,
            hintText: getCurrentLanguageValue(LASTNAME) ?? "",
            labelText: getCurrentLanguageValue(LASTNAME) ?? "",
            labelPaddingTop: 20,
          ),

          InputWidget(
            controller: dateController,
            hintText: getCurrentLanguageValue(DATE) ?? "",
            labelText: getCurrentLanguageValue(DATE) ?? "",
            labelPaddingTop: 20,
          ),

          InputWidget(
            controller: usernameController,
            hintText: getCurrentLanguageValue(USERNAME) ?? "",
            labelText: getCurrentLanguageValue(USERNAME) ?? "",
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
    );
  }
}
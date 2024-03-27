import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';
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
  final Function() iconOnTap;
  final Function() inputOnTap;

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
    required this.iconOnTap,
    required this.inputOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text18(
            text: getCurrentLanguageValue(CHILD_DATA) ?? "",
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
            hintText: getCurrentLanguageValue(BIRTHDAY) ?? "",
            labelText: getCurrentLanguageValue(BIRTHDAY) ?? "",
            labelPaddingTop: 20,
            showSuffixIcon: true,
            suffixIcon: Icons.calendar_today,
            iconOnTap: iconOnTap,
            readOnly: true,
            onTap: inputOnTap,
            iconColor: black25,

          ),

          InputWidget(
            controller: usernameController,
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
    );
  }
}
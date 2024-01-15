import 'package:flutter/material.dart';
import 'package:football_next_gen/widgets/texts.dart';
import '../../../../../constants/language.dart';
import '../../../../../widgets/inputs.dart';

class ParentDataForm extends StatelessWidget{

  final GlobalKey formKey;
  TextEditingController nameController;
  TextEditingController lastNameController;
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


  ParentDataForm({
    super.key,
    required this.formKey,
    required this.confirmPasswordController,
    required this.passwordController,
    required this.phoneController,
    required this.nameController,
    required this.lastNameController,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text18(
                text: getCurrentLanguageValue(PARENT_DATA) ?? "",
            ),
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
    );
  }
}
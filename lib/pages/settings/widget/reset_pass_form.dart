import 'package:flutter/material.dart';

import '../../../constants/language.dart';
import '../../../widgets/inputs.dart';

class ResetPasswordForm extends StatelessWidget {

  TextEditingController oldPasswordController;
  TextEditingController newPasswordController;
  TextEditingController confirmPasswordController;
  final IconData suffixIconOldPassword;
  final IconData suffixIconNewPassword;
  final IconData suffixIconConfirmPass;
  final bool obscureTextOldPassword;
  final bool obscureTextNewPassword;
  final bool obscureTextConfirmPass;
  final Function() oldPasswordOnTap;
  final Function() newPasswordOnTap;
  final Function() confirmPassOnTap;

  ResetPasswordForm({
    super.key,
    required this.confirmPasswordController,
    required this.newPasswordController,
    required this.oldPasswordController,
    required this.suffixIconOldPassword,
    required this.suffixIconNewPassword,
    required this.suffixIconConfirmPass,
    required this.obscureTextOldPassword,
    required this.obscureTextNewPassword,
    required this.obscureTextConfirmPass,
    required this.oldPasswordOnTap,
    required this.newPasswordOnTap,
    required this.confirmPassOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputWidget(
            controller: oldPasswordController,
            hintText: getCurrentLanguageValue(OLD_PASSWORD) ?? "",
            labelText: getCurrentLanguageValue(OLD_PASSWORD) ?? "",
            showSuffixIcon: true,
            suffixIcon: suffixIconOldPassword,
            obscureText: obscureTextOldPassword,
            iconOnTap: oldPasswordOnTap
        ),
        InputWidget(
            controller: newPasswordController,
            hintText: getCurrentLanguageValue(NEW_PASSWORD) ?? "",
            labelText: getCurrentLanguageValue(NEW_PASSWORD) ?? "",
            labelPaddingTop: 20,
            showSuffixIcon: true,
            suffixIcon: suffixIconNewPassword,
            obscureText: obscureTextNewPassword,
            iconOnTap: newPasswordOnTap
        ),
        InputWidget(
            controller: confirmPasswordController,
            hintText: getCurrentLanguageValue(CONFIRM_NEW_PASSWORD) ?? "",
            labelText: getCurrentLanguageValue(CONFIRM_NEW_PASSWORD) ?? "",
            labelPaddingTop: 20,
            showSuffixIcon: true,
            suffixIcon: suffixIconConfirmPass,
            obscureText: obscureTextConfirmPass,
            iconOnTap: confirmPassOnTap
        ),
      ],
    );
  }
}

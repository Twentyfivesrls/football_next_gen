import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/pages/settings/widget/pointed_list.dart';
import 'package:football_next_gen/pages/settings/widget/reset_pass_form.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';

import '../../constants/colors.dart';
import '../../models/confirm_page_data.dart';
import '../../widgets/buttons.dart';
import '../../widgets/divider.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<StatefulWidget> createState() => ResetPasswordState();
}

class ResetPasswordState extends State<ResetPassword> {

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var oldPasswordVisible = false;
  var newPasswordVisible = false;
  var confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: 3,
      paddingTop: 0,
      showBackIcon: true,
      trailingIcon: Icons.home,
      title: AppPage.resetPassword.toTitle,
      goHome: () {
        context.go(AppPage.homeSportsCenter.path);
      },
      goBack: () {
        context.pop();
      },
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            instructionsSection(),
            formSection(),
            buttonsSection()
          ],
        ),
      ),
    );
  }

  Widget instructionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text14(
              text: getCurrentLanguageValue(RESET_PASS_HEADER) ?? ""
          ),
        ),
        PointedList(),

      ],
    );
  }

  Widget formSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: ResetPasswordForm(
          confirmPasswordController: confirmPasswordController,
          newPasswordController: newPasswordController,
          oldPasswordController: oldPasswordController,
          suffixIconOldPassword: oldPasswordVisible ? Icons.visibility : Icons.visibility_off,
          suffixIconNewPassword: newPasswordVisible ? Icons.visibility : Icons.visibility_off,
          suffixIconConfirmPass: confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
          obscureTextOldPassword: !oldPasswordVisible,
          obscureTextNewPassword: !newPasswordVisible,
          obscureTextConfirmPass: !confirmPasswordVisible,
          oldPasswordOnTap: (){
            setState(() {
              oldPasswordVisible = !oldPasswordVisible;
            });
          },
          newPasswordOnTap: (){
            setState(() {
              newPasswordVisible = !newPasswordVisible;
            });
          },
          confirmPassOnTap: (){
            setState(() {
              confirmPasswordVisible = !confirmPasswordVisible;
            });
          },
      ),
    );
  }

  Widget buttonsSection() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 50),
          child: DividerWidget(),
        ),

        ActionButton(
          onPressed: () {
            context.push(AppPage.confirmPage.path, extra: ConfirmPageData.resetPasswordConfirmed(context));
          },
          text: getCurrentLanguageValue(CHANGE_PASSWORD) ?? "",
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ActionButton(
            onPressed: () {
              context.pop();
            },
            text: getCurrentLanguageValue(CANCEL) ?? "",
            backgroundColor: cancelGrey,
            borderColor: cancelGrey,
          ),
        )
      ],
    );
  }
}


import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/inputs.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/app_pages.dart';

class RecoverPasswordForm extends StatefulWidget{
  const RecoverPasswordForm({super.key});
  @override
  State<StatefulWidget> createState() => RecoverPasswordFormState();
}

class RecoverPasswordFormState extends State<RecoverPasswordForm>{

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Expanded(
          flex: 1,
          child: titleSection(),
        ),
        Expanded(
          flex: 2,
          child:subtitleSection(),
        ),
        Expanded(
          flex: 4,
          child:formSection(),
        ),
        Expanded(
          flex: 1,
          child:backToLoginSection(),
        )
      ],
    );
  }

  Widget titleSection(){
    return TextH1(
      text: getCurrentLanguageValue(RECOVER_PASSWORD_TITLE) ?? "",
      textAlign: TextAlign.center,
    );
  }

  Widget subtitleSection(){
    return Text16(
      text: getCurrentLanguageValue(RECOVER_PASSWORD_SUBTITLE) ?? "",
      textAlign: TextAlign.center,
      fontWeight: FontWeight.w500,
    );
  }

  Widget formSection(){
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputWidget(
            controller: emailController,
            hintText: getCurrentLanguageValue(EMAIL) ?? "",
          ),

          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: ActionButton(
              onPressed: (){
                GoRouter.of(context).go(AppPage.recoverPasswordConfirmed.path);
              },
              text: getCurrentLanguageValue(SEND) ?? "",
            ),
          )
        ],
      ),
    );
  }

  Widget backToLoginSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Text16(
            text: getCurrentLanguageValue(BACK_TO_LOGIN) ?? "",
          ),
        ),
        NavigationText(
          text: getCurrentLanguageValue(LOGIN) ?? "",
          onTap: (){
            context.pop();
          },
        ),
      ],
    );
  }
}
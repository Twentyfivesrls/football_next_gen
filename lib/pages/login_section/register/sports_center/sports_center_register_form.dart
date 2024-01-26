import 'package:flutter/material.dart';
import 'package:football_next_gen/pages/login_section/register/sports_center/widgets/sports_center_data.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/app_pages.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/language.dart';
import '../../../../widgets/buttons.dart';
import '../../../../widgets/checkbox.dart';
import '../../../../widgets/divider.dart';
import '../../../../widgets/texts.dart';

class SportsCenterRegisterForm extends StatefulWidget{
  const SportsCenterRegisterForm({super.key});
  @override
  State<StatefulWidget> createState() => SportsCenterRegisterFormState();
}

class SportsCenterRegisterFormState extends State<SportsCenterRegisterForm>{

  bool isChecked = false;
  var passwordVisible = false;
  var confirmPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            formSection(),
            checkboxSection(),
            createAccountButtonSection(),
            goBackSection()
          ],
        )
    );
  }

  Widget formSection() {
    return SportCenterData(
      formKey: _formKey,
      emailController: emailController,
      confirmPasswordController: confirmPasswordController,
      passwordController: passwordController,
      phoneController: phoneController,
      nameController: nameController,
      cityController: cityController,
      suffixIconConfirmPassword: confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
      suffixIconPassword: passwordVisible ? Icons.visibility : Icons.visibility_off,
      obscureTextConfirmPass: !confirmPasswordVisible,
      confirmPasswordOnTap:  (){
        setState(() {
          confirmPasswordVisible = !confirmPasswordVisible;
        });
      },
      passwordOnTap:  (){
        setState(() {
          passwordVisible = !passwordVisible;
        });
      },
      obscureTextPass: !passwordVisible,
    );
  }

  Widget checkboxSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CheckboxWidget(
          isChecked: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 2),
                child: Text10(text: getCurrentLanguageValue(ACCEPT) ?? ""),
              ),
              NavigationText(
                text: getCurrentLanguageValue(TERMS_OF_SERVICE) ?? "",
                onTap: (){},
                fontSize: 12,
                textColor: primary,
                underline: TextDecoration.none,
              ),
            ],
          )
      ),
    );
  }

  Widget createAccountButtonSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: ActionButton(
        onPressed: (){
          context.push(AppPage.insertOtp.path);
        },
        text: getCurrentLanguageValue(CREATE_ACCOUNT) ?? "",
      ),
    );
  }

  Widget goBackSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Text14(
                  text: getCurrentLanguageValue(ALREDY_HAVE_ACCOUNT) ?? "",
                ),
              ),
              NavigationText(
                text: getCurrentLanguageValue(ACCEDI) ?? "",
                onTap: (){
                  context.go(AppPage.login.path);
                },
              ),
            ],
          ),
        ),
        const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: DividerWidget(
              indent: 70,
              endIndent: 70,
            )
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Text14(
                text: getCurrentLanguageValue(BACK_TO) ?? "",
              ),
            ),
            NavigationText(
              text: getCurrentLanguageValue(ACCOUNT_CHOICE) ?? "",
              underline: TextDecoration.none,
              onTap: (){
                context.go(AppPage.register.path);
              },
            ),
          ],
        ),
      ],
    );
  }
}
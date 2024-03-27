import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:football_next_gen/auth/auth_listener.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/models/authentication_entity.dart';
import 'package:football_next_gen/models/confirm_page_data.dart';
import 'package:football_next_gen/models/profile_entity.dart';
import 'package:football_next_gen/models/user_entity.dart';
import 'package:football_next_gen/pages/login_section/register/parent/widgets/child_data.dart';
import 'package:football_next_gen/pages/login_section/register/parent/widgets/parent_data.dart';
import 'package:football_next_gen/repository/auth/keycloack_repository.dart';
import 'package:football_next_gen/repository/profile/profile_service.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/checkbox.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/app_pages.dart';
import '../../../../constants/language.dart';
import '../../../../widgets/texts.dart';
import 'package:intl/intl.dart';

class ParentRegisterForm extends StatefulWidget{
  const ParentRegisterForm({super.key});
  @override
  State<StatefulWidget> createState() => ParentRegisterFormState();
}

class ParentRegisterFormState extends State<ParentRegisterForm>{
  bool isChecked = false;
  var passwordVisible = false;
  var confirmPasswordVisible = false;
  var parentPasswordVisible = false;
  var parentConfirmPasswordVisible = false;
  var datePicked;

  //PARENT FORM
  final parentKey = GlobalKey<FormState>();
  TextEditingController parentEmailController = TextEditingController();
  TextEditingController parentLastNameController = TextEditingController();
  TextEditingController parentNameController = TextEditingController();
  TextEditingController parentPhoneController = TextEditingController();
  TextEditingController parentPasswordController = TextEditingController();
  TextEditingController parentConfirmPasswordController = TextEditingController();

  //CHILD FORM
  final childKey = GlobalKey<FormState>();
  TextEditingController childUsernameController = TextEditingController();
  TextEditingController childLastNameController = TextEditingController();
  TextEditingController childNameController = TextEditingController();
  TextEditingController childDateController = TextEditingController();
  TextEditingController childPasswordController = TextEditingController();
  TextEditingController childConfirmPasswordController = TextEditingController();
  String error = "";



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            parentFormSection(),
            uploadDocumentSection(),
            childSection(),
            checkboxSection(),
            createAccountButtonSection(),
            goBackSection()
          ],
        )
    );
  }

  Widget parentFormSection() {
    return ParentDataForm(
      formKey: parentKey,
      confirmPasswordController: parentConfirmPasswordController,
      passwordController: parentPasswordController,
      phoneController: parentPhoneController,
      nameController: parentNameController,
      lastNameController: parentLastNameController,
      emailController: parentEmailController,
      suffixIconConfirmPassword: parentConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
      suffixIconPassword: parentPasswordVisible ? Icons.visibility : Icons.visibility_off,
      obscureTextConfirmPass: !parentConfirmPasswordVisible,
      confirmPasswordOnTap:  (){
        setState(() {
          parentConfirmPasswordVisible = !parentConfirmPasswordVisible;
        });
      },
      passwordOnTap:  (){
        setState(() {
          parentPasswordVisible = !parentPasswordVisible;
        });
      },
      obscureTextPass: !parentPasswordVisible,
    );
  }

  Widget uploadDocumentSection() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 5),
            child: Text14(
              text: getCurrentLanguageValue(UPLOAD_DOCUMENT) ?? "",
              fontWeight: FontWeight.w600,
            ),
          ),

          Text10(
            text: getCurrentLanguageValue(UPLOAD_DOCUMENT_SUBTITLE) ?? "",
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ActionButton(
              onPressed: () {
              },
              text: getCurrentLanguageValue(UPLOAD_DOCUMENT) ?? "",
              backgroundColor: secondary,
              textColor: primary,
              borderColor: secondary,
              showPrefixIcon: true,
              svgPrefixIcon: ImagesConstants.uploadImg,
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: DividerWidget(),
          )
        ],
      ),
    );
  }

  Widget childSection() {
    return ChildDataForm(
      iconOnTap: () async {
        datePicked = await DatePicker.showSimpleDatePicker(
          context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          dateFormat: "dd-MMMM-yyyy",
          locale: DateTimePickerLocale.it,
          titleText: getCurrentLanguageValue(SELECT_DATE) ?? "",
          cancelText: getCurrentLanguageValue(CANCEL) ?? "",
          confirmText: getCurrentLanguageValue(CONFIRM) ?? "",
          textColor: black25,
        );
        if(datePicked != null){
          String formattedDate = DateFormat('dd/MM/yyyy').format(datePicked);

          setState(() {
            childDateController.text = formattedDate;
          });
        }
      },
      inputOnTap: ()async {
        datePicked = await DatePicker.showSimpleDatePicker(
            context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            dateFormat: "dd-MMMM-yyyy",
            locale: DateTimePickerLocale.it,
            titleText: getCurrentLanguageValue(SELECT_DATE) ?? "",
            cancelText: getCurrentLanguageValue(CANCEL) ?? "",
            confirmText: getCurrentLanguageValue(CONFIRM) ?? "",
            textColor: black25
        );
        if(datePicked != null){
          String formattedDate = DateFormat('dd/MM/yyyy').format(datePicked);

          setState(() {
            childDateController.text = formattedDate;
          });
        }
      },
      formKey: childKey,
      confirmPasswordController: childConfirmPasswordController,
      passwordController: childPasswordController,
      dateController: childDateController,
      nameController: childNameController,
      lastNameController: childLastNameController,
      usernameController: childUsernameController,
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
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 50),
          child: DividerWidget(),
        ),
        CheckboxWidget(
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
      ],
    );
  }

  Widget createAccountButtonSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: ActionButton(
        onPressed: () async {
          // Creazione del genitore
          var parentUser = UserEntity(
            username: parentEmailController.text,
            password: parentPasswordController.text,
            role: "genitore",
            profile: ProfileEntity(
              profileName: parentNameController.text,
              phone: parentPhoneController.text,
              address: "parentAddressController.text",
              email: parentEmailController.text,
            ),
          );

          // Creazione del bambino
          var childUser = UserEntity(
            username: childUsernameController.text,
            password: childPasswordController.text,
            role: "bambino",
            profile: ProfileEntity(
              profileName: childNameController.text,
              phone: "childPhoneController.text",
              address: "childAddressController.text",
              email: "childEmailController.text",
            ),
          );

          // Esegui entrambe le chiamate API contemporaneamente
          var parentResult = KeycloakRepository().createUser(parentUser);
          var childResult = KeycloakRepository().createUser(childUser);

          // Attendi il completamento di entrambe le chiamate
          await Future.wait([parentResult, childResult]);

            // Redirect alla pagina di conferma
            context.push(AppPage.confirmPage.path, extra: ConfirmPageData.otpConfirmed(context));

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
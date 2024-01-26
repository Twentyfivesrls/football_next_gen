import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/language.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/images_constants.dart';
import '../../../../widgets/buttons.dart';
import '../../../../widgets/inputs.dart';
import '../../../../widgets/texts.dart';

class AddTournamentForm extends StatelessWidget{

  TextEditingController nameController;
  TextEditingController typologyController;
  TextEditingController categoryController;
  TextEditingController rulesController;
  TextEditingController infoController;
  TextEditingController phoneController;
  TextEditingController emailController;
  final Function() uploadPoster;

  AddTournamentForm({
    super.key,
    required this.nameController,
    required this.categoryController,
    required this.typologyController,
    required this.phoneController,
    required this.emailController,
    required this.rulesController,
    required this.infoController,
    required this.uploadPoster});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputWidget(
          labelPaddingTop: 30,
          controller: nameController,
          labelText: "Nome torneo*",
          hintText: "Nome torneo",
        ),

        InputWidget(
          labelPaddingTop: 20,
          controller: typologyController,
          labelText: "Tipologia*",
          hintText: "Tipologia",
        ),

        InputWidget(
          labelPaddingTop: 20,
          controller: categoryController,
          labelText: "Categoria*",
          hintText: "Categoria",
        ),

        InputWidget(
          labelPaddingTop: 20,
          controller: phoneController,
          labelText: "Contatto telefonico*",
          hintText: "Contatto telefonico",
        ),

        InputWidget(
          labelPaddingTop: 20,
          controller: emailController,
          labelText: "Contatto email",
          hintText: "Contatto email",
        ),


        InputWidget(
          labelPaddingTop: 20,
          controller: rulesController,
          minLines: 4,
          maxLines: 20,
          labelText: "Regole*",
          hintText: "Regole",
        ),


        InputWidget(
          labelPaddingTop: 20,
          controller: infoController,
          minLines: 4,
          maxLines: 20,
          labelText: "Ulteriori info",
          hintText: "Ulteriori info",
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10,top: 20),
          child: Text14(
            text: getCurrentLanguageValue(UPLOAD_POSTER) ?? "",
            fontWeight: FontWeight.w600,
          ),
        ),

        Text10(
          text: getCurrentLanguageValue(UPLOAD_POSTER_SUBTITLE) ?? "",
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ActionButton(
            onPressed: uploadPoster,
            backgroundColor: secondary,
            textColor: primary,
            showPrefixIcon: true,
            borderColor: secondary,
            svgPrefixIcon: ImagesConstants.uploadImg,
            text: getCurrentLanguageValue(UPLOAD_IMAGE) ?? "",
          ),
        ),
      ],
    );
  }

}
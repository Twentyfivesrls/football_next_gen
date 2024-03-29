import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/inputs.dart';
import 'package:football_next_gen/widgets/texts.dart';

class HomeTeamForm extends StatelessWidget{
  TextEditingController nameController;
  TextEditingController managerController;
  TextEditingController descriptionController;
  TextEditingController coachController;
  final Function() uploadLogo;
  final bool edit;

  HomeTeamForm({
    super.key,
    required this.nameController,
    required this.coachController,
    required this.managerController,
    required this.descriptionController,
    required this.uploadLogo,
    required this.edit
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: InputWidget(
              controller: nameController,
              labelText: "Nome società*",
              hintText: getCurrentLanguageValue(TEAM_NAME) ?? "" ,
            ),
          ),

          Visibility(
            visible: !edit,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10,top: 20),
              child: Text14(
                text: getCurrentLanguageValue(UPLOAD_LOGO) ?? "",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Visibility(
            visible: !edit,
            child: Text10(
              text: getCurrentLanguageValue(UPLOAD_LOGO_SUBTITLE) ?? "",
            ),
          ),

         Visibility(
           visible: !edit,
           child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ActionButton(
                  onPressed: uploadLogo,
                  backgroundColor: secondary,
                  textColor: primary,
                  showPrefixIcon: true,
                  borderColor: secondary,
                  svgPrefixIcon: ImagesConstants.uploadImg,
                  text: getCurrentLanguageValue(UPLOAD_IMAGE) ?? "",
              ),
            ),
         ),


          InputWidget(
            labelPaddingTop: 20,
            controller: coachController,
            hintText: getCurrentLanguageValue(COACH) ?? "",
            labelText: "Allenatore*",
          ),

          InputWidget(
            labelPaddingTop: 20,
            controller: managerController,
            hintText: getCurrentLanguageValue(MANAGER) ?? "",
            labelText:"Dirigente*",
          ),

          InputWidget(
            labelPaddingTop: 20,
            controller: descriptionController,
            minLines: 4,
            maxLines: 20,
            hintText: getCurrentLanguageValue(DESCRIPTION) ?? "",
            labelText: getCurrentLanguageValue(DESCRIPTION) ?? "",
          ),

        ],

    );
  }

}
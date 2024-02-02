import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/inputs.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/app_pages.dart';
import '../../../../constants/language.dart';
import '../../../../models/confirm_page_data.dart';
import '../../../../widgets/dialog.dart';
import '../../../../widgets/divider.dart';

class AddPost extends StatefulWidget{
  const AddPost({super.key});

  @override
  State<StatefulWidget> createState() => AddPostState();
}

class AddPostState extends State<AddPost>{
  @override
  Widget build(BuildContext context) {

    final TextEditingController descriptionController = TextEditingController();

    return ScaffoldWidget(
        paddingTop: 30,
        appBar: 3,
        title: AppPage.addPost.toTitle,
        showTrailingIcon: false,
        goHome: (){},
        goBack: (){
          showDialog(
              context: context,
              builder: (BuildContext context){
                return DialogWidget(
                  title: 'Avviso',
                  message: 'Procedendo in questo modo, tutti i dati inseriti andranno persi. Vuoi davvero annullare la creazione del nuovo post?',
                  confirmText: 'Elimina post',
                  cancelText: getCurrentLanguageValue(CANCEL) ?? "",
                  onConfirm: () {
                    context.go(AppPage.sportsCenterProfile.path);
                  },
                );
              });
          },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text14(
              text: getCurrentLanguageValue(UPLOAD_IMAGE) ?? "",
              fontWeight: FontWeight.w600,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 20),
              child: Text10(text: getCurrentLanguageValue(ACCEPTED_FORMATS) ?? ""),
            ),

            ActionButton(
                onPressed: (){},
                text: getCurrentLanguageValue(UPLOAD_IMAGE) ?? "",
                showPrefixIcon: true,
                svgPrefixIcon: ImagesConstants.uploadImg,
                backgroundColor: secondary,
                borderColor: secondary,
              textColor: primary,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: InputWidget(
                  controller: descriptionController,
                  labelText: getCurrentLanguageValue(DESCRIPTION) ?? "",
                  hintText: getCurrentLanguageValue(DESCRIPTION) ?? "",
                  minLines: 4,
                  maxLines: 20,
              ),
            ),

            buttonsSection()

          ],
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
            context.push(AppPage.confirmPage.path, extra: ConfirmPageData.addPostConfirmed(context));
          },
          text: getCurrentLanguageValue(NEXT) ?? "",
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return DialogWidget(
                      title: 'Avviso',
                      message: 'Procedendo in questo modo, tutti i dati inseriti andranno persi. Vuoi davvero annullare la creazione del nuovo post?',
                      confirmText: 'Elimina post',
                      cancelText: getCurrentLanguageValue(CANCEL) ?? "",
                      onConfirm: () {
                        context.go(AppPage.sportsCenterProfile.path);
                      },
                    );
                  });
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
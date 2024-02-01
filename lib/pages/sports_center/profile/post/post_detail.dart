import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/widgets/info_box.dart';
import 'package:football_next_gen/widgets/inputs.dart';
import 'package:football_next_gen/widgets/popup_menu.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';
import '../../../../widgets/buttons.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({super.key});

  @override
  State<StatefulWidget> createState() => PostDetailState();
}

class PostDetailState extends State<PostDetail> {
  final String sportsCenterName = 'Sport Center srl';
  final String date = '13 agosto 2024';
  final String description = 'Il talento in azione! 🚀⚽ Un momento catturato dal campo del Centro Sportivo Olympus, dove il nostro eccezionale calciatore, Marco Rossi, dimostra la sua abilità straordinaria nel calcio. 🌐✨ Un calcio potente, una precisione impeccabile - è davvero il cuore pulsante della nostra squadra! 🏆👟 Marco, grazie per ispirarci con la tua dedizione e passione per il gioco. 🙌💙 Se anche tu vuoi far parte di questa incredibile esperienza calcistica, unisciti a noi al Centro Sportivo Olympus! 🏟️⚡   #Talent #CalcioPassion #CentroSportivoOlympus';
  bool selected = false;
  bool edit = false;
  final TextEditingController descriptionController = TextEditingController();
/* List <PopupMenuItem> items = [
    PopupMenuItem(
      child: Text14(text: getCurrentLanguageValue(EDIT) ?? ""),
      value: getCurrentLanguageValue(EDIT),
      onTap: (){
        setState(() {
          edit = !edit;
        });
      },
    ),

    PopupMenuItem(
      child: Text14(text: getCurrentLanguageValue(DELETE) ?? ""),
      value: getCurrentLanguageValue(DELETE),
      onTap: (){},
    ),
  ]; */

  List<String> list = [
    'Modifica',
    'Elimina'
  ];

  @override
  void initState() {
    descriptionController.text = description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      paddingTop: 30,
      appBar: 3,
      showTrailingIcon: false,
      title: AppPage.postDetail.toTitle,
      goHome: () {},
      goBack: () {
        context.push(AppPage.sportsCenterProfile.path);
      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerSection(),
            imageSection(),
            descriptionSection(),
            buttonsSection()
          ],
        ),
      ),
    );
  }

  Widget headerSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(ImagesConstants.sportsCenterProfileImg,
                  height: 30, width: 30),
            ),
            Text14(
              text: sportsCenterName,
              fontWeight: FontWeight.w600,
            )
          ],
        ),

        PopupMenuButton(
          elevation: 5,
          icon: const Icon(Icons.more_vert,color: black25,),
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            PopupMenuItem(
                onTap: (){
                  setState(() {
                    edit = !edit;
                  });
                },
                value: getCurrentLanguageValue(EDIT),
                child: Text14(text: getCurrentLanguageValue(EDIT) ?? "")
            ),
            PopupMenuItem(
                onTap: (){},
                value: getCurrentLanguageValue(DELETE),
                child: Text14(text: getCurrentLanguageValue(DELETE) ?? "")
            ),
          ],
        ),

     /*   PopupMenuWidget(
            items: items,
        ) */
      ],
    );
  }

  Widget imageSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Image.asset(ImagesConstants.postImg),
    );
  }

  Widget descriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: (){
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: Icon(
                    selected ? Icons.favorite : Icons.favorite_border_outlined,
                    color: selected ? Colors.red : black25,
                    size: 25,
                  )
              ),
              GestureDetector(
                  onTap: (){},
                  child: const Icon(
                      Icons.share_outlined,
                      color: black25,
                      size: 25,

                  )
              ),
            ],
          ),
        ),
        Visibility(
          visible: !edit,
          child: InfoBoxWidget(
            labelText: getCurrentLanguageValue(DESCRIPTION) ?? "",
            showIcon: false,
            text: description,
          ),
        ),

        Visibility(
            visible: edit,
            child: InputWidget(
              labelText: getCurrentLanguageValue(DESCRIPTION) ?? "",
              controller: descriptionController,
              hintText: getCurrentLanguageValue(DESCRIPTION) ?? "",
              minLines: 4,
              maxLines: 20,
            )
        ),

        Visibility(
          visible: !edit,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text14(text: date),
          ),
        ),
      ],
    );
  }

  Widget buttonsSection() {
    return Visibility(
      visible: edit,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            ActionButton(
              onPressed: () {
                setState(() {
                  edit = !edit;
                });
              },
              text: getCurrentLanguageValue(SAVE) ?? "",
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ActionButton(
                onPressed: () {
                  setState(() {
                    edit = !edit;
                  });
                },
                text: getCurrentLanguageValue(CANCEL) ?? "",
                backgroundColor: cancelGrey,
                borderColor: cancelGrey,
              ),
            )
          ],
        ),
      ),
    );
  }
}

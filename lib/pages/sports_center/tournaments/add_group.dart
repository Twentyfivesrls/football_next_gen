import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/widgets/add_match_form.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/inputs.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/colors.dart';
import '../../../constants/images_constants.dart';
import '../../../constants/language.dart';
import '../../../models/confirm_page_data.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/dialog.dart';

class TextEditingControllerGroup {
  TextEditingController homeTeamController = TextEditingController();
  TextEditingController awayTeamController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController hourController = TextEditingController();
}

class AddGroup extends StatefulWidget {

  final String id;
  const AddGroup({super.key, required this.id});

  @override
  State<StatefulWidget> createState() => AddGroupState();
}

class AddGroupState extends State<AddGroup> {

  TextEditingController homeTeamController = TextEditingController();
  TextEditingController awayTeamController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController hourController = TextEditingController();
  TextEditingController groupNameController = TextEditingController();
  List<TextEditingControllerGroup> matchList = List.empty(growable: true);

  @override
  void initState() {
    matchList.add(TextEditingControllerGroup());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      showFirstTrailingIcon: false,
      paddingTop: 0,
      title: AppPage.addGroup.toTitle,
      appBar: 3,
      firstTrailingIconOnTap: () {},
      secondTrailingIconOnTap: (){},
      goBack: () {
        showDialog(
            context: context,
            builder: (BuildContext context){
              return DialogWidget(
                title: 'Avviso',
                message: 'Procedendo in questo modo, tutti i dati inseriti andranno persi. Vuoi davvero annullare la creazione del girone?',
                confirmText: 'Elimina girone',
                cancelText: getCurrentLanguageValue(CANCEL) ?? "",
                onConfirm: () {
                  context.go(AppPage.tournamentDetail.path, extra: widget.id);
                },
              );
            });
        },
      body: SingleChildScrollView(
        child: Column(
          children: [

            groupNameSection(),

            ...matchList.map((e) =>
                AddMatchForm(
                    matchTitle: "Partita 1",
                    awayTeamController: awayTeamController,
                    homeTeamController: homeTeamController,
                    placeController: placeController,
                    dateController: dateController,
                    hourController: hourController,
                    cancellable: matchList.indexOf(e) == 0 ? false : true,
                    deleteMatch: (){
                      setState(() {
                        matchList.remove(e);
                      });
                    },
                    addNewTeam: () {
                      context.push(AppPage.addTeam.path);
                    }
                )
            ),
            newMatchButtonSection(),
            buttonsSection()
          ],
        ),
      ),
    );
  }

  Widget groupNameSection(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: InputWidget(
            controller: groupNameController,
            hintText: getCurrentLanguageValue(GROUP_NAME) ?? "",
            labelText: getCurrentLanguageValue(GROUP_NAME) ?? "",
          ),
        ),
        const DividerWidget(),
      ],
    );
  }

  Widget newMatchButtonSection() {
    return
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ActionButton(
          onPressed: () {
            setState(() {
              matchList.add(TextEditingControllerGroup());
            });
          },
          text: getCurrentLanguageValue(ADD_MATCH) ?? "",
          backgroundColor: white,
          borderColor: textProfileGrey,
          rowLayout: false,
          height: 114,
          showPrefixIcon: true,
          textColor: textProfileGrey,
          svgPrefixIcon: ImagesConstants.addCircleImg,
        ),
      );
  }

  Widget buttonsSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: ActionButton(
            onPressed: () {
              context.push(AppPage.confirmPage.path, extra: ConfirmPageData.addGroupConfirmed(context));
            },
            text: getCurrentLanguageValue(ADD_GROUP) ?? "",
          ),
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
                      message: 'Procedendo in questo modo, tutti i dati inseriti andranno persi. Vuoi davvero annullare la creazione del girone?',
                      confirmText: 'Elimina girone',
                      cancelText: getCurrentLanguageValue(CANCEL) ?? "",
                      onConfirm: () {
                        context.go(AppPage.tournamentDetail.path, extra: widget.id);
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
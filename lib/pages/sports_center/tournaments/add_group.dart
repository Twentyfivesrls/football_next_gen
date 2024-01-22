import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/widgets/add_match_form.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/colors.dart';
import '../../../constants/images_constants.dart';
import '../../../constants/language.dart';
import '../../../models/confirm_page_data.dart';
import '../../../widgets/buttons.dart';


class TextEditingControllerGroup {
  TextEditingController homeTeamController = TextEditingController();
  TextEditingController awayTeamController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController hourController = TextEditingController();
}


class AddGroup extends StatefulWidget {
  const AddGroup({super.key});

  @override
  State<StatefulWidget> createState() => AddGroupState();
}

class AddGroupState extends State<AddGroup> {

  TextEditingController homeTeamController = TextEditingController();
  TextEditingController awayTeamController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController hourController = TextEditingController();
  List<TextEditingControllerGroup> matchList = List.empty(growable: true);
  int counter = 1;


  @override
  void initState() {
    matchList.add(TextEditingControllerGroup());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      showTrailingIcon: false,
      paddingTop: 0,
      title: AppPage.addGroup.toTitle,
      appBar: 3,
      goHome: () {},
      goBack: () {
        context.pop();
      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...matchList.map((e) =>
                AddMatchForm(
                    matchTitle: "Partita $counter",
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

  Widget newMatchButtonSection() {
    return
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ActionButton(
          onPressed: () {
            setState(() {
              counter = counter+1;
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
              context.push(AppPage.confirmPage.path,
                  extra: ConfirmPageData.addGroupConfirmed(context));
            },
            text: getCurrentLanguageValue(ADD_GROUP) ?? "",
          ),
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
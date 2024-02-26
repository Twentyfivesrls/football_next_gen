import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/models/confirm_page_data.dart';
import 'package:football_next_gen/pages/sports_center/teams/widgets/away_team_form.dart';
import 'package:football_next_gen/pages/sports_center/teams/widgets/home_team_form.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/dropdown_menu.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/language.dart';
import '../../../widgets/dialog.dart';
const List<String> list = <String>['Squadra in casa', 'Squadra in trasferta'];

class AddTeam extends StatefulWidget{
  const AddTeam({super.key});

  @override
  State<StatefulWidget> createState() => AddTeamState();

}

class AddTeamState extends State<AddTeam>{

  TextEditingController nameController = TextEditingController();
  TextEditingController coachController = TextEditingController();
  TextEditingController managerController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool showHome = true;
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      goBack: (){
        showDialog(
            context: context,
            builder: (BuildContext context){
              return DialogWidget(
                title: 'Avviso',
                message: 'Procedendo in questo modo, tutti i dati inseriti andranno persi. Vuoi davvero annullare la creazione della squadra?',
                confirmText: 'Elimina squadra',
                cancelText: getCurrentLanguageValue(CANCEL) ?? "",
                onConfirm: () {
                  context.go(AppPage.teamsList.path);
                },
              );
            });
      },
      paddingTop: 30,
      appBar: 3,
      showFirstTrailingIcon: false,
      title: AppPage.addTeam.toTitle,
      firstTrailingIconOnTap: (){},
      secondTrailingIconOnTap: (){},
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              dropdownSection(),


              Visibility(
                  visible: showHome,
                  child: homeTeamSection()
              ),

              Visibility(
                  visible: !showHome,
                  child: awayTeamSection()
              ),

              buttonsSection()
            ],
          )
      ),
    );
  }

  Widget dropdownSection() {
    return DropdownMenuWidget(
        onSelected: (String? value){
          setState(() {
            dropdownValue = value!;
            if(value == list[0]){
              showHome = true;
            }else{
              showHome = false;
            }
          });
        },
        initialSelection: list.first,
        list: list
    );
  }

  Widget awayTeamSection() {
    return AwayTeamForm(
      nameController: nameController,
      coachController: coachController,
      managerController: managerController,
      descriptionController: descriptionController,
      uploadLogo: () {  },
    );
  }

  Widget homeTeamSection() {
    return HomeTeamForm(
      nameController: nameController,
      coachController: coachController,
      managerController: managerController,
      descriptionController: descriptionController,
      uploadLogo: () {  },
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
          onPressed: (){
            context.push(AppPage.confirmPage.path, extra: ConfirmPageData.addTeamConfirmed(context));
          },
          text: getCurrentLanguageValue(ADD_TEAM) ?? "",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ActionButton(
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return DialogWidget(
                      title: 'Avviso',
                      message: 'Procedendo in questo modo, tutti i dati inseriti andranno persi. Vuoi davvero annullare la creazione della squadra?',
                      confirmText: 'Elimina squadra',
                      cancelText: getCurrentLanguageValue(CANCEL) ?? "",
                      onConfirm: () {
                        context.go(AppPage.teamsList.path);
                      },
                    );
                  });
            },
            text: getCurrentLanguageValue(CANCEL) ?? "",
            backgroundColor: cancelGrey,
            borderColor: cancelGrey,
          ),
        ),

      ],
    );
  }

}
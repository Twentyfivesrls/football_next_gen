import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/widgets/add_tournament_form.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/colors.dart';
import '../../../constants/language.dart';
import '../../../models/confirm_page_data.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/dialog.dart';
import '../../../widgets/scaffold.dart';

class AddTournament extends StatefulWidget{
  const AddTournament({super.key});

  @override
  State<StatefulWidget> createState() => AddTournamentState();

}

class AddTournamentState extends State<AddTournament>{

  TextEditingController nameController = TextEditingController();
  TextEditingController typologyController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController rulesController = TextEditingController();
  TextEditingController infoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: 3,
      paddingTop: 0,
      showTrailingIcon: false,
      title: AppPage.addTournament.toTitle,
      goBack: (){
        showDialog(
            context: context,
            builder: (BuildContext context){
              return DialogWidget(
                title: 'Avviso',
                message: 'Procedendo in questo modo, tutti i dati inseriti andranno persi. Vuoi davvero annullare la creazione del torneo?',
                confirmText: 'Elimina torneo',
                cancelText: getCurrentLanguageValue(CANCEL) ?? "",
                onConfirm: () {
                  context.go(AppPage.tournamentsList.path);
                },
              );
            });
      },
      goHome: (){},
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddTournamentForm(
                nameController: nameController,
                categoryController: categoryController,
                typologyController: typologyController,
                phoneController: phoneController,
                emailController: emailController,
                rulesController: rulesController,
                infoController: infoController,
                uploadPoster: (){},
            ),
            buttonsSection()
          ],
        ),
      ),
    );
  }

  Widget buttonsSection(){
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 50),
          child: DividerWidget(),
        ),
        ActionButton(
          onPressed: (){
            context.push(AppPage.confirmPage.path, extra: ConfirmPageData.addTournamentConfirmed(context));
          },
          text: "Crea torneo",
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
                      message: 'Procedendo in questo modo, tutti i dati inseriti andranno persi. Vuoi davvero annullare la creazione del torneo?',
                      confirmText: 'Elimina torneo',
                      cancelText: getCurrentLanguageValue(CANCEL) ?? "",
                      onConfirm: () {
                        context.go(AppPage.tournamentsList.path);
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
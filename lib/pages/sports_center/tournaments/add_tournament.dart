import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/bloc/tournaments/create_tournament_cubit.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/models/tournament.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/widgets/add_tournament_form.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/colors.dart';
import '../../../constants/language.dart';
import '../../../models/confirm_page_data.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/dialog.dart';
import '../../../widgets/scaffold.dart';

class AddTournament extends StatelessWidget{
  const AddTournament({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateTournamentCubit(),
      child: AddTournamentWidget() ,
    );
  }
}

class AddTournamentWidget extends StatefulWidget{
  const AddTournamentWidget({super.key});

  @override
  State<StatefulWidget> createState() => AddTournamentState();

}

class AddTournamentState extends State<AddTournamentWidget>{

  TextEditingController nameController = TextEditingController();
  TextEditingController typologyController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController rulesController = TextEditingController();
  TextEditingController infoController = TextEditingController();

  CreateTournamentCubit get _createTournamentCubit => context.read<CreateTournamentCubit>();


  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: 3,
      paddingTop: 0,
      showFirstTrailingIcon: false,
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
      firstTrailingIconOnTap: (){},
      secondTrailingIconOnTap: (){},
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

  Widget buttonsSection() {
    return BlocBuilder<CreateTournamentCubit, CreateTournamentState>(
        builder: (_, state) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: DividerWidget(),
              ),
              ActionButton(
                onPressed: () {
                  final tournamentEntity = TournamentEntity(typology: typologyController.text,
                      category: categoryController.text,
                      phone: phoneController.text,
                      email: emailController.text,
                      rules: rulesController.text,
                      info: infoController.text,
                      poster: "poster", name: nameController.text);
                  _createTournamentCubit.fetchCreateTournament(tournamentEntity);
                  context.push(AppPage.confirmPage.path, extra: ConfirmPageData.addTournamentConfirmed(context, tournamentEntity.id ?? 0));

                },
                text: "Crea torneo",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ActionButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
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
        });
  }
}
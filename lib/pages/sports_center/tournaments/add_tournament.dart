import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/bloc/tournaments/create_tournament_cubit.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/models/tournament.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/widgets/add_tournament_form.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../constants/colors.dart';
import '../../../constants/language.dart';
import '../../../models/confirm_page_data.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/dialog.dart';
import '../../../widgets/scaffold.dart';

class AddTournament extends StatelessWidget{
  final bool edit;
  const AddTournament({super.key, required this.edit});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateTournamentCubit(),
      child: AddTournamentWidget(edit: edit) ,
    );
  }
}

class AddTournamentWidget extends StatefulWidget{
  final bool edit;
  const AddTournamentWidget({super.key, required this.edit});
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
  XFile? imageFile;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: 3,
      paddingTop: 0,
      showFirstTrailingIcon: false,
      title: widget.edit ? "Modifica torneo" : AppPage.addTournament.toTitle,
      goBack: (){
        showDialog(
            context: context,
            builder: (BuildContext context){
              return DialogWidget(
                title: 'Avviso',
                message: widget.edit ? 'Procedendo in questo modo, tutti i dati modificati andranno persi. Vuoi davvero annullare la modifica del torneo?': 'Procedendo in questo modo, tutti i dati inseriti andranno persi. Vuoi davvero annullare la creazione del torneo?',
                confirmText: widget.edit ? 'Elimina modifiche' : 'Elimina torneo',
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
                edit: widget.edit,
                nameController: nameController,
                categoryController: categoryController,
                typologyController: typologyController,
                phoneController: phoneController,
                emailController: emailController,
                rulesController: rulesController,
                infoController: infoController,
                uploadPoster: (){
                  showModalBottomSheet<void>(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 200,
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              MaterialButton(
                                onPressed: openGallery,
                                minWidth: MediaQuery.of(context).size.width,
                                height: 80,
                                elevation: 0,
                                focusElevation: 0,
                                highlightElevation: 0,
                                child: const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Icon(Icons.photo_library_outlined,size: 30,color: primary,),
                                    ),
                                    Text18(
                                      text: "Galleria",
                                      textColor: primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                              MaterialButton(
                                onPressed: openCamera,
                                minWidth: MediaQuery.of(context).size.width,
                                height: 80,
                                elevation: 0,
                                focusElevation: 0,
                                highlightElevation: 0,
                                child:const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Icon(Icons.camera_alt_outlined,size: 30,color: primary,),
                                    ),
                                    Text18(
                                      text: "Camera",
                                      textColor: primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
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
                  context.push(AppPage.confirmPage.path, extra: ConfirmPageData.addTournamentConfirmed(context, tournamentEntity.id ?? 0, widget.edit));
                },
                text: widget.edit ? "Modifica torneo" : "Crea torneo",
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
                            message: widget.edit ? 'Procedendo in questo modo, tutti i dati modificati andranno persi. Vuoi davvero annullare la modifica del torneo?': 'Procedendo in questo modo, tutti i dati inseriti andranno persi. Vuoi davvero annullare la creazione del torneo?',
                            confirmText: widget.edit ? 'Elimina modifiche' : 'Elimina torneo',
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

  openGallery() {
    ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      setState(() {
        imageFile = value;
      });
      context.pop();
    });
  }

  openCamera() {
    ImagePicker().pickImage(source: ImageSource.camera).then((value) {
      setState(() {
        imageFile = value;
      });
      context.pop();
    });
  }
}
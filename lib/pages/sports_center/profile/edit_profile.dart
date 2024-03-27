import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/models/extra_service.dart';
import 'package:football_next_gen/models/sport.dart';
import 'package:football_next_gen/models/sport_field.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/add_extra_services.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/add_fields.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/add_sports.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/edit_profile_header.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/profile_contacts.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:go_router/go_router.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<StatefulWidget> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController fieldController = TextEditingController();
  final List<String> sportsList = ["Calcio", "Basket"];
  final List<String> extraServicesList = ["Bar", "Ristorante"];

  final List<SportEntity> sports = [
    SportEntity(name: "Calcio", svgIcon: ImagesConstants.footballImg),
    SportEntity(name: "Basket", svgIcon: ImagesConstants.basketImg),
    SportEntity(name: "Tennis", svgIcon: ImagesConstants.tennisImg),
  ];

  final List<ExtraServiceEntity> extraServices = [
    ExtraServiceEntity(name: "Bar", svgIcon: ImagesConstants.localCafeImg),
    ExtraServiceEntity(
        name: "Ristorante", svgIcon: ImagesConstants.flatwareImg),
    ExtraServiceEntity(name: "Sauna", svgIcon: ImagesConstants.saunaImg),
  ];

  final List<SportFieldEntity> fields = [
    SportFieldEntity(
        name: "Calcio", svgIcon: ImagesConstants.eventsImg, fieldsNumber: "5"),
    SportFieldEntity(
        name: "Basket", svgIcon: ImagesConstants.eventsImg, fieldsNumber: "5"),
    SportFieldEntity(
        name: "Tennis", svgIcon: ImagesConstants.eventsImg, fieldsNumber: "5"),
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      paddingTop: 0,
      paddingBottom: 30,
      appBar: 3,
      title: AppPage.editProfile.toTitle,
      firstTrailingIconOnTap: () {
        context.go(AppPage.homeSportsCenter.path);
      },
      secondTrailingIconOnTap: () {},
      firstTrailingIcon: Icons.home,
      goBack: () {
        context.pop();
      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            EditProfileHeader(
              profileName: 'profileName',
              imageProfile: ImagesConstants.sportsCenterProfileImg,
              profileDesc: 'profileDesc',
              descriptionController: descriptionController,
              follower: '0',
              post: '0',
              archive: '0',
              goToFollowers: () {
                context.push(AppPage.followerList.path);
              },
            ),
            profileContacts('aaaaa', 'bbbbbb', 'cccccc'),
            AddSports(
              kOptions: sportsList,
              sports: sports,
              removeSport: () {},
            ),
            AddFields(
              sports: sports,
              fieldController: fieldController,
            ),
            AddExtraServices(
                kOptions: extraServicesList,
                extraServices: extraServices,
                removeExtraService: (){})
          ],
        ),
      ),
    );
  }

  Widget profileContacts(String address, String email, String phone) {
    return ProfileContacts(
      address: address,
      email: email,
      phone: phone,
      paddingLeft: 0,
      paddingRight: 0,
      paddingTop: 0,
      editContacts: () {},
    );
  }
}

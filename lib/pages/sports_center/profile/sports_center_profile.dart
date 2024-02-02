import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/models/extra_service.dart';
import 'package:football_next_gen/models/image_entity.dart';
import 'package:football_next_gen/models/sport.dart';
import 'package:football_next_gen/models/sport_field.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/extra_services.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/images_gallery.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/maps.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/tabbar.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/profile_contacts.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/profile_header.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/profile_sports.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/sports_field.dart';
import 'package:football_next_gen/widgets/tabbar_view.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/app_pages.dart';
import '../../../constants/colors.dart';
import '../../../widgets/texts.dart';

class SportsCenterProfile extends StatefulWidget {
  const SportsCenterProfile({super.key});

  @override
  State<StatefulWidget> createState() => SportsCenterProfileState();
}

class SportsCenterProfileState extends State<SportsCenterProfile> with TickerProviderStateMixin {
  final String profileName = "Sport Center srl";
  final String profileDesc = "Il playground urbano per gli appassionati di sport! Dai il massimo su campi misti di calcio, tennis, basket e altro ancora. Benvenuto nel nostro mondo di divertimento e competizione!";
  final String address = "Via Vattelapesca, 22 - Roma, Italia";
  final String phone = "+39 3406484620";
  final String email = "sportcenter@mail.com";

  var sports = [
    SportEntity(name: 'Calcio', svgIcon: ImagesConstants.footballImg),
    SportEntity(name: 'Basket', svgIcon: ImagesConstants.basketImg),
    SportEntity(name: 'Tennis', svgIcon: ImagesConstants.tennisImg),
  ];

  var fields = [
    SportFieldEntity(
        name: 'Calcio',
        svgIcon: ImagesConstants.footballImg,
        fieldsNumber: '6'),
    SportFieldEntity(
        name: 'Basket', svgIcon: ImagesConstants.basketImg, fieldsNumber: '2'),
    SportFieldEntity(
        name: 'Tennis', svgIcon: ImagesConstants.tennisImg, fieldsNumber: '4'),
  ];

  var services = [
    ExtraServiceEntity(name: 'Bar', svgIcon: ImagesConstants.localCafeImg),
    ExtraServiceEntity(name: 'Ristorante', svgIcon: ImagesConstants.flatwareImg),
    ExtraServiceEntity(name: 'Sauna', svgIcon: ImagesConstants.saunaImg),
  ];

  var images = [
    ImageEntity(imageUrl: ImagesConstants.postImg),
    ImageEntity(imageUrl: ImagesConstants.postImg),
    ImageEntity(imageUrl: ImagesConstants.postImg),
    ImageEntity(imageUrl: ImagesConstants.postImg),
    ImageEntity(imageUrl: ImagesConstants.postImg),
    ImageEntity(imageUrl: ImagesConstants.postImg),
    ImageEntity(imageUrl: ImagesConstants.postImg),
    ImageEntity(imageUrl: ImagesConstants.postImg),
  ];

  late final TabController tabController;
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {
        activeIndex = tabController.index;
      });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        goBack: () {
          context.pop();
        },
        goHome: () {
          context.go(AppPage.homeSportsCenter.path);
        },
        appBar: 2,
        paddingRight: 0,
        paddingLeft: 0,
        paddingTop: 0,
        paddingBottom: 0,
        trailingIcon: Icons.home,
        //  showSearchInput: true,
        //  searchController: searchController,
        //  hintText: 'egg',
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileHeader(
                  profileName: profileName,
                  profileDesc: profileDesc,
                  editProfile: () {},
                ),
                TabbarWidget(
                  tabController: tabController,
                  activeIndex: activeIndex,
                  tabs: <Widget>[
                    Tab(
                      child: Text14(
                        text: 'Informazioni',
                        fontWeight: activeIndex == 0
                            ? FontWeight.w600
                            : FontWeight.w500,
                        textColor: activeIndex == 0 ? primary : textProfileGrey,
                      ),
                    ),
                    Tab(
                      child: Text14(
                        text: 'Post',
                        fontWeight: activeIndex == 1
                            ? FontWeight.w600
                            : FontWeight.w500,
                        textColor: activeIndex == 1 ? primary : textProfileGrey,
                      ),
                    ),

                    Tab(
                      child: Text14(
                        text: 'Media',
                        fontWeight: activeIndex == 2
                            ? FontWeight.w600
                            : FontWeight.w500,
                        textColor: activeIndex == 2 ? primary : textProfileGrey,
                      ),
                    ),
                  ],
                ),

                Expanded(
                  child: TabbarViewWidget(
                      tabController: tabController,
                      firstTab: SingleChildScrollView(
                        child: Column(
                          children: [
                            ProfileContacts(
                              address: address,
                              email: email,
                              phone: phone,
                              editContacts: () {},
                            ),
                            ProfileSports(sports: sports, editSports: () {}),
                            SportsField(fields: fields, editSports: () {}),
                            ExtraServices(
                                editSports: () {}, services: services),
                           /* Maps(
                              editMap: () {},
                              viewMap: () {},
                            )*/
                          ],
                        ),
                      ),
                      secondTab: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                                child: ActionButton(
                                  onPressed: () {
                                    context.push(AppPage.addPost.path);
                                  },
                                  text: getCurrentLanguageValue(ADD_POST) ?? "",
                                  showPrefixIcon: true,
                                  svgPrefixIcon:
                                      ImagesConstants.addCircleWhiteImg,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text18(
                                  text: getCurrentLanguageValue(PHOTO_AND_VIDEO) ?? "",
                                  textColor: primary,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: ImagesGallery(
                                    images: images,
                                    onTap: (){
                                      context.push(AppPage.postDetail.path);
                                    }
                                )
                              )
                            ],
                          ),
                        ),
                      thirdTab: SingleChildScrollView(
                        child: Center(),
                      ),
                      )),

              ],
            ),
          ),
        ));
  }
}

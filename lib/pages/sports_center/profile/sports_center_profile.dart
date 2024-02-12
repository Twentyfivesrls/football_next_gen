import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/models/extra_service.dart';
import 'package:football_next_gen/models/file_entity.dart';
import 'package:football_next_gen/models/image_entity.dart';
import 'package:football_next_gen/models/sport.dart';
import 'package:football_next_gen/models/sport_field.dart';
import 'package:football_next_gen/pages/sports_center/profile/tabs/info_tab.dart';
import 'package:football_next_gen/pages/sports_center/profile/tabs/media_tab.dart';
import 'package:football_next_gen/pages/sports_center/profile/tabs/post_tab.dart';
import 'package:football_next_gen/widgets/tabbar.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/profile_header.dart';
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
  var files = [
    FileEntity(url: '',name: 'Comunicazione_avviso.pdf'),
    FileEntity(url: '',name: 'Comunicazione_avviso.pdf'),
    FileEntity(url: '',name: 'Comunicazione_avviso.pdf'),
  ];
  late final TabController tabController;
  int activeIndex = 0;
  DateTime date = DateTime.now();

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
        goBack: () {context.pop();},
        goHome: () {context.go(AppPage.homeSportsCenter.path);},
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
                TabBarWidget(
                  tabController: tabController,
                  activeIndex: activeIndex,
                  tabs: <Widget>[
                    Tab(
                      child: Text14(
                        text: 'Informazioni',
                        fontWeight: activeIndex == 0 ? FontWeight.w600 : FontWeight.w500,
                        textColor: activeIndex == 0 ? primary : textProfileGrey,
                      ),
                    ),
                    Tab(
                      child: Text14(
                        text: 'Post',
                        fontWeight: activeIndex == 1 ? FontWeight.w600 : FontWeight.w500,
                        textColor: activeIndex == 1 ? primary : textProfileGrey,
                      ),
                    ),

                    Tab(
                      child: Text14(
                        text: 'Media',
                        fontWeight: activeIndex == 2 ? FontWeight.w600 : FontWeight.w500,
                        textColor: activeIndex == 2 ? primary : textProfileGrey,
                      ),
                    ),
                  ],
                ),

                Expanded(
                    child: TabbarViewWidget(
                      tabController: tabController,
                      firstTab: InfoTab(
                          address: address,
                          phone: phone,
                          email: email,
                          fields: fields,
                          sports: sports,
                          services: services
                      ),
                      secondTab: PostTab(
                          images: images,
                          addPost: () {context.push(AppPage.addPost.path);},
                          goToDetail: (){context.push(AppPage.postDetail.path);}
                      ),
                      thirdTab: MediaTab(
                        addFile: (){},
                        date: date,
                        files: files,
                      )
                    )
                ),
              ],
            ),
          ),
        )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/edit_profile_header.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/profile_contacts.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:go_router/go_router.dart';

class EditProfile extends StatefulWidget{
  const EditProfile({super.key});

  @override
  State<StatefulWidget> createState() =>  EditProfileState();
}


class EditProfileState extends State<EditProfile>{

  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        appBar: 3,
        title: AppPage.editProfile.toTitle,
        firstTrailingIconOnTap: (){
          context.go(AppPage.homeSportsCenter.path);
        },
        secondTrailingIconOnTap: (){},
        firstTrailingIcon: Icons.home,
        goBack: (){
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
                followed: '0',
                goToFollowers: () {
                  context.push(AppPage.followerList.path);
                },
              ),
              profileContacts('aaaaa','bbbbbb','cccccc')

            ],
          ),
        ),

    );
  }


  Widget profileContacts(String address, String email, String phone){
    return  ProfileContacts(
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
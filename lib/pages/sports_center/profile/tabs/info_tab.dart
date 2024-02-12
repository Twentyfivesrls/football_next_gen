import 'package:flutter/material.dart';
import 'package:football_next_gen/models/extra_service.dart';
import 'package:football_next_gen/models/sport.dart';
import 'package:football_next_gen/models/sport_field.dart';

import '../widgets/extra_services.dart';
import '../widgets/profile_contacts.dart';
import '../widgets/profile_sports.dart';
import '../widgets/sports_field.dart';

class InfoTab extends StatelessWidget {
  final String address;
  final String phone;
  final String email;
  final List<SportFieldEntity> fields;
  final List<SportEntity> sports;
  final List<ExtraServiceEntity> services;

  const InfoTab({
      super.key,
      required this.address,
      required this.phone,
      required this.email,
      required this.fields,
      required this.sports,
      required this.services
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          ExtraServices(editSports: () {}, services: services),
          /* Maps(
               editMap: () {},
               viewMap: () {},
           )*/
        ],
      ),
    );
  }
}

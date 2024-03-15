import 'package:flutter/material.dart';
import 'package:football_next_gen/models/child_profile_entity.dart';
import 'package:football_next_gen/pages/child/profile/widgets/career.dart';
import 'package:football_next_gen/pages/child/profile/widgets/curiosity.dart';
import 'package:football_next_gen/pages/child/profile/widgets/physical_data.dart';
import 'package:football_next_gen/pages/child/profile/widgets/registry.dart';
import 'package:football_next_gen/pages/child/profile/widgets/technical_data.dart';

class ChildInfoTab extends StatelessWidget{


  final ChildProfileEntity profile;


  const ChildInfoTab({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileRegistry(
            profile: profile,
          ),

          PhysicalData(
            profile: profile,
          ),

          TechnicalData(
            profile: profile,
          ),
          Career(
              profile: profile
          ),

          Curiosity(
              profile: profile
          )
        ],
      ),
    );
  }
}
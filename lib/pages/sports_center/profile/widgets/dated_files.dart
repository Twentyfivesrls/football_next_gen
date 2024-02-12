import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/info_box.dart';
import 'package:football_next_gen/widgets/texts.dart';
import '../../../../models/file_entity.dart';
import 'package:intl/intl.dart';

class DatedFiles extends StatelessWidget{

  final List<FileEntity> files;
  final DateTime date;

  const DatedFiles({super.key, required this.files, required this.date});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd MMMM yyyy').format(date);
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text14(
              text: formattedDate,
              textColor: cancelGrey,
            ),
          ),

          ...files.map((e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: InfoBoxWidget(
              labelText: e.name,
              showBottomText: false,
              svgIcon: ImagesConstants.fileImg,
              underline: true,
            ),
          )),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: DividerWidget(),
          )

        ],
      ),
    );
  }

}
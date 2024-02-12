import 'package:flutter/material.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/dated_files.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/images_constants.dart';
import '../../../../constants/language.dart';
import '../../../../models/file_entity.dart';
import '../../../../widgets/buttons.dart';
import '../../../../widgets/texts.dart';

class MediaTab extends StatelessWidget{

  final Function() addFile;
  final DateTime date;
  final List<FileEntity> files;

  const MediaTab({super.key, required this.addFile, required this.date, required this.files});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
            child: ActionButton(
              onPressed: addFile,
              text: getCurrentLanguageValue(ADD_FILE) ?? "",
              showPrefixIcon: true,
              svgPrefixIcon:
              ImagesConstants.addCircleWhiteImg,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text18(
              text: getCurrentLanguageValue(UPLOADS) ?? "",
              textColor: primary,
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DatedFiles(
                files: files,
                date: date
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DatedFiles(
                files: files,
                date: date
            ),
          )




        ],
      ),
    );
  }
}